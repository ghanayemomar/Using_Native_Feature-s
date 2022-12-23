import 'package:flutter/foundation.dart';
import 'dart:io';

//
class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;
  PlaceLocation(
      {this.address, @required this.latitude, @required this.longitude});
} //that allow's us to identify a unique place.

//
class Place {
  final String id;
  final String title;
  final PlaceLocation loaction;
  final File image; //we used file beacuse this data saved on the device
  Place(
      {@required this.id,
      @required this.title,
      @required this.image,
      @required this.loaction});
}
