import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inqual_app/directions.dart';
import 'package:inqual_app/directions_repository.dart';
import 'dart:ui' as ui;

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
      CameraPosition(target: LatLng(37.0, -122.0), zoom: 11.5);

  late GoogleMapController _googleMapController;
  Marker? _origin;
  Marker? _destination;
  Directions? _info;
  BitmapDescriptor? myIcon;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
            markerId: MarkerId('origin'),
            infoWindow: const InfoWindow(title: 'Origin'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: pos);
        _destination = null;

        _info = null;
      });
    } else {
      setState(() {
        _destination = Marker(
            markerId: MarkerId('destination'),
            infoWindow: InfoWindow(title: 'Destination'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
            position: pos);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Google Maps'),
        actions: [
          if (_origin != null)
            TextButton(
                onPressed: () => _googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(
                        target: _origin!.position, zoom: 14.5, tilt: 50.0))),
                style: TextButton.styleFrom(
                    primary: Colors.green,
                    textStyle: TextStyle(fontWeight: FontWeight.w400)),
                child: Text('ORIGIN')),
          if (_destination != null)
            TextButton(
                onPressed: () => _googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(
                        target: _destination!.position,
                        zoom: 14.5,
                        tilt: 50.0))),
                style: TextButton.styleFrom(
                    primary: Colors.green,
                    textStyle: TextStyle(fontWeight: FontWeight.w400)),
                child: Text('DEST')),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              if (_origin != null) _origin!,
              if (_destination != null) _destination!
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
            onLongPress: _addMarker,
          ),
          if (_info != null)
            Positioned(
              top: 20.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
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
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
          onPressed: () => _googleMapController.animateCamera(_info != null
              ? CameraUpdate.newLatLngBounds(_info!.bounds, 100.0)
              : CameraUpdate.newCameraPosition(_initialCameraPosition)),
          child: const Icon(Icons.center_focus_strong)),
    );
  }
}
