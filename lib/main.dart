import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inqual_app/directions.dart';

import 'package:inqual_app/screens/events_screen.dart';
import 'package:inqual_app/screens/services_screen.dart';
import 'package:inqual_app/maps_markers.dart';

void main() {
  runApp(MaterialApp(
      title: 'Inqual App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      initialRoute: '/',
      routes: {"/": (context) => MapScreen()}));
}

class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // TODO: Set actual location
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(43.2220, 76.8512), zoom: 11.5);

  late GoogleMapController _googleMapController;
  final Marker _currentPosition = Marker(
      markerId: const MarkerId('origin'),
      infoWindow: const InfoWindow(title: 'Origin'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(43.2220, 76.8512));

  Directions? _info;
  BitmapDescriptor? myIcon;

  // Bools for places
  bool showRestaurants = false;
  bool showCinemas = false;
  bool showParks = false;
  bool showPharmacies = false;
  bool showGroceries = false;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  static List<Widget> pages = <Widget>[EventsScreen(), ServicesScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ? Stack(
              alignment: Alignment.center,
              children: [
                GoogleMap(
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition: _initialCameraPosition,
                  onMapCreated: (controller) =>
                      _googleMapController = controller,
                  markers: {
                    _currentPosition,
                    if (showRestaurants) ...restaurantsMarkers,
                    if (showCinemas) ...cinemaMarkers,
                    if (showParks) ...parksMarkers,
                    if (showPharmacies) ...pharmacyMarkers,
                    if (showGroceries) ...groceryStoresMarkers,
                  },
                  polylines: {
                    if (_info != null)
                      Polyline(
                          polylineId: const PolylineId('overview_polyline'),
                          color: Colors.red,
                          width: 5,
                          points: _info!.polylinePoints
                              .map((e) => LatLng(e.latitude, e.longitude))
                              .toList())
                  },
                ),
                if (_info != null)
                  Positioned(
                    top: 20.0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                      decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0),
                          ]),
                    ),
                  )
              ],
            )
          : pages[_currentIndex - 1],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _currentIndex == 0
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                    backgroundColor: Colors.redAccent,
                    onPressed: () {
                      setState(() {
                        showRestaurants = !showRestaurants;
                      });
                    },
                    child: const Icon(
                      Icons.restaurant,
                      color: Colors.white,
                    )),
                FloatingActionButton(
                    backgroundColor: Colors.green,
                    onPressed: () {
                      setState(() {
                        showParks = !showParks;
                      });
                    },
                    child: const Icon(
                      Icons.park,
                      color: Colors.white,
                    )),
                FloatingActionButton(
                    backgroundColor: Colors.amber,
                    onPressed: () {
                      setState(() {
                        showCinemas = !showCinemas;
                      });
                    },
                    child: const Icon(
                      Icons.local_pharmacy,
                      color: Colors.white,
                    )),
                FloatingActionButton(
                    backgroundColor: Colors.orange,
                    onPressed: () {
                      setState(() {
                        showPharmacies = !showPharmacies;
                      });
                    },
                    child: const Icon(
                      Icons.local_grocery_store,
                      color: Colors.white,
                    )),
                FloatingActionButton(
                    backgroundColor: Colors.cyan,
                    onPressed: () {
                      setState(() {
                        showGroceries = !showGroceries;
                      });
                    },
                    child: const Icon(
                      Icons.theater_comedy,
                      color: Colors.white,
                    )),
              ],
            )
          : SizedBox(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        // Sets the current index of BottomNavigationBar.
        currentIndex: _currentIndex,
        onTap: (index) {
          // Calls manager.goToTab() when the user taps a different tab,
          //to notify other widgets that the index changed.
          setState(() {
            _currentIndex = index;
          });
          ;
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Inqual',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            label: 'Services',
          ),
        ],
      ),
    );
  }
}
