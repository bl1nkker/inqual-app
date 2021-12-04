import 'package:google_maps_flutter/google_maps_flutter.dart';

List<Marker> restaurantsMarkers = [
  Marker(
      markerId: const MarkerId('restaurant_1'),
      infoWindow: const InfoWindow(title: 'Shafran'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: const LatLng(43.312285, 76.922864)),
  Marker(
      markerId: const MarkerId('restaurant_2'),
      infoWindow: const InfoWindow(title: 'Hard Rock cafe'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: const LatLng(43.249345, 76.915408)),
  Marker(
      markerId: const MarkerId('restaurant_3'),
      infoWindow: const InfoWindow(title: 'Restaurant'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: const LatLng(43.2233, 76.8517)),
];

List<Marker> parksMarkers = [
  Marker(
      markerId: const MarkerId('park_1'),
      infoWindow: const InfoWindow(
          title: 'Парк имени Первого Президента Республики Казахстан'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(43.187184, 76.886580)),
  Marker(
      markerId: const MarkerId('park_2'),
      infoWindow: const InfoWindow(title: 'Алматинский ботанический сад'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(43.225762, 76.914573)),
  Marker(
      markerId: const MarkerId('park_3'),
      infoWindow: const InfoWindow(title: 'Кок-Тюбе'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(43.232518, 76.976010)),
];

List<Marker> cinemaMarkers = [
  Marker(
      markerId: const MarkerId('cinema_1'),
      infoWindow: const InfoWindow(title: 'Chaplin Mega'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      position: const LatLng(43.202449, 76.891970)),
  Marker(
      markerId: const MarkerId('cinema_2'),
      infoWindow: const InfoWindow(title: 'Cinema Towers 3D'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      position: const LatLng(43.237235, 76.915048)),
  Marker(
      markerId: const MarkerId('cinema_3'),
      infoWindow: const InfoWindow(title: 'Kinopark 11 Esentai IMAX 3D'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      position: const LatLng(43.218240, 76.928094)),
];

List<Marker> pharmacyMarkers = [
  Marker(
      markerId: const MarkerId('pharmacy_1'),
      infoWindow: const InfoWindow(title: 'Аптека Плюс'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      position: const LatLng(43.227737, 76.905239)),
  Marker(
      markerId: const MarkerId('pharmacy_2'),
      infoWindow: const InfoWindow(title: '5-я линия'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      position: const LatLng(43.226286, 76.906128)),
  Marker(
      markerId: const MarkerId('pharmacy_3'),
      infoWindow: const InfoWindow(title: 'Europharma'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      position: const LatLng(43.239450, 76.907879)),
  Marker(
      markerId: const MarkerId('pharmacy_4'),
      infoWindow: const InfoWindow(title: 'Садыхан'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      position: const LatLng(43.235453, 76.900352)),
  Marker(
      markerId: const MarkerId('pharmacy_5'),
      infoWindow: const InfoWindow(title: 'Аптечный склад'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      position: const LatLng(43.218713, 76.897705)),
  Marker(
      markerId: const MarkerId('pharmacy_6'),
      infoWindow: const InfoWindow(
          title: 'Центр обслуживания населения Алмалинского района № 2'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      position: const LatLng(43.251042, 76.912197)),
  Marker(
      markerId: const MarkerId('pharmacy_7'),
      infoWindow: const InfoWindow(
          title: 'Центр обслуживания населения Бостандыкского района'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      position: const LatLng(43.207608, 76.901045)),
];

List<Marker> groceryStoresMarkers = [
  Marker(
      markerId: const MarkerId('gstores_1'),
      infoWindow: const InfoWindow(title: 'Магазин Столичный'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      position: const LatLng(43.249245, 76.940710)),
  Marker(
      markerId: const MarkerId('gstores_2'),
      infoWindow: const InfoWindow(title: 'Магазин Самал Deluxe'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      position: const LatLng(43.230385, 76.958248)),
  Marker(
      markerId: const MarkerId('gstores_3'),
      infoWindow: const InfoWindow(title: 'HelloEco ZeroWaste Store'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      position: const LatLng(43.228578, 76.951529)),
  Marker(
      markerId: const MarkerId('gstores_4'),
      infoWindow: const InfoWindow(title: 'Magnum Cash & Carry'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      position: const LatLng(43.206154, 76.897653)),
  Marker(
      markerId: const MarkerId('gstores_5'),
      infoWindow: const InfoWindow(title: 'Galmart'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      position: const LatLng(43.233376, 76.955376)),
];
