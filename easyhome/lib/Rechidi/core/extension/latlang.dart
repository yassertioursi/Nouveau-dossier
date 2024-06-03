import 'package:google_maps_flutter/google_maps_flutter.dart';

extension MarkerExtension on LatLng {
  Marker toMarker() => Marker(
        markerId: const MarkerId("Me"),
        position: this,
      );
}
