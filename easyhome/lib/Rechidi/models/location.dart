import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationEntity {
  LocationEntity({
    required this.latitude,
    required this.longitude,
    required this.title,
    this.subTitle = '',
  });
  VoidCallback? onTap;
  final double latitude;
  final double longitude;
  final String title;
  final String subTitle;

  Marker get marker => Marker(
        markerId: MarkerId('$latitude$longitude$title$subTitle'),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: title, snippet: subTitle),
        icon: BitmapDescriptor.defaultMarkerWithHue(22),
        onTap: onTap,
      );

  factory LocationEntity.fromJson(Map<String, dynamic> json) {
    return LocationEntity(
      latitude: json['lat'] as double,
      longitude: json['lng'] as double,
      title: json['title'] as String,
      subTitle: json['subTitle'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': latitude,
      'lng': longitude,
      'title': title,
      'subTitle': subTitle,
    };
  }
}
