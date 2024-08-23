import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FoodMap2 extends StatefulWidget {
  const FoodMap2({Key? key}) : super(key: key);

  @override
  State<FoodMap2> createState() => FoodDonationMap2();
}

class FoodDonationMap2 extends State<FoodMap2> {
  late GoogleMapController mapController;
  Map<String, Marker> _markers = {};

  final List<MapMarkerInfo> locations = [
    MapMarkerInfo(
      id: 'Location 1',
      position: LatLng(12.9672, 80.1495),
      title: 'Donator',
      snippet: '',
    ),
    MapMarkerInfo(
      id: 'Location 2',
      position: LatLng(13.0328, 80.1612),
      title: 'Donator',
      snippet: '',
    ),
    MapMarkerInfo(
      id: 'Location 3',
      position: LatLng(13.0596, 80.2588),
      title: 'NGO',
      snippet: 'If no donor is available we will help you',
    ),
    MapMarkerInfo(
      id: 'Location 4',
      position: LatLng(13.0177, 80.2231),
      title: 'Donator',
      snippet: '',
    ),
    MapMarkerInfo(
      id: 'Location 5',
      position: LatLng(13.0725, 80.1989),
      title: 'Donator',
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
                    'Food Donators',
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