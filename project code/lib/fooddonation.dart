import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FoodMap1 extends StatefulWidget {
  const FoodMap1({Key? key}) : super(key: key);

  @override
  State<FoodMap1> createState() => FoodDonationMap1();
}

class FoodDonationMap1 extends State<FoodMap1> {
  late GoogleMapController mapController;
  Map<String, Marker> _markers = {};

  final List<MapMarkerInfo> locations = [
    MapMarkerInfo(
      id: 'Location 1',
      position: LatLng(13.0735, 80.2573),
      title: 'Acceptor',
      snippet: '',
    ),
    MapMarkerInfo(
      id: 'Location 2',
      position: LatLng(13.0945, 80.1863),
      title: 'Acceptor',
      snippet: '',
    ),
    MapMarkerInfo(
      id: 'Location 3',
      position: LatLng(12.9975, 80.2566),
      title: 'NGO',
      snippet: 'If u cant reach out to anyone donate here',
    ),
    MapMarkerInfo(
      id: 'Location 4',
      position: LatLng(13.0850, 80.2105),
      title: 'Acceptor',
      snippet: '',
    ),
    MapMarkerInfo(
      id: 'Location 5',
      position: LatLng(12.7965, 80.2233),
      title: 'Acceptor',
      snippet: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: locations[0].position, // Use the first location as the initial camera position
              zoom: 14,
            ),
            onMapCreated: (controller) {
              mapController = controller;
              for (final markerInfo in locations) {
                addMarker(markerInfo);
              }
            },
            markers: _markers.values.toSet(),
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'In Need of Food',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addMarker(MapMarkerInfo markerInfo) {
    final marker = Marker(
      markerId: MarkerId(markerInfo.id),
      position: markerInfo.position,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: InfoWindow(
        title: markerInfo.title,
        snippet: markerInfo.snippet,
      ),
    );

    _markers[markerInfo.id] = marker;
    setState(() {});
  }
}

class MapMarkerInfo {
  final String id;
  final LatLng position;
  final String title;
  final String snippet;

  MapMarkerInfo({
    required this.id,
    required this.position,
    required this.title,
    required this.snippet,
  });
}
