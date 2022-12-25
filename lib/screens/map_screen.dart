import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initalLocation;
  final bool isSelecting;

  MapScreen(
      {this.initalLocation =
          const PlaceLocation(latitude: 31.9522, longitude: 35.2332),
      this.isSelecting = false});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Google Map")),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(widget.initalLocation.latitude,
                  widget.initalLocation.longitude),
              zoom: 16),
        ));
  }
}
