import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBuilder extends StatelessWidget {
  const MapBuilder({
    super.key,
    required CameraPosition initialCameraPosition,
    Set<Marker> markerList = const {},
    Set<Circle> circles = const {},
    required Completer<GoogleMapController> controller,
    void Function(LatLng)? onTap,
  })  : _initialCameraPosition = initialCameraPosition,
        _markerList = markerList,
        _controller = controller,
        _onTap = onTap,
        _circles = circles;

  final CameraPosition _initialCameraPosition;
  final Set<Marker> _markerList;
  final Completer<GoogleMapController> _controller;
  final void Function(LatLng)? _onTap;
  final Set<Circle> _circles;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _initialCameraPosition,
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      markers: _markerList,
      onTap: _onTap,
      mapType: MapType.terrain,
      circles: _circles,
      onMapCreated: (controller) => _controller.complete(controller),
    );
  }
}
