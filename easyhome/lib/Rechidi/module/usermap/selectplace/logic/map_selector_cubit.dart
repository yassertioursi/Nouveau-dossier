import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_selector_state.dart';
part 'map_selector_cubit.freezed.dart';

class MapSelectorCubit extends Cubit<MapSelectorState> {
  MapSelectorCubit() : super(const MapSelectorState.initial());

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(35.2053765, -0.7137929),
    zoom: 15,
  );
  final Completer<GoogleMapController> controller = Completer();

  Marker marker = const Marker(
    markerId: MarkerId(''),
    position: LatLng(30.5670197, 4.6911217),
  );

  Future<void> setMyLocation({LatLng? place}) async {
    emit(const MapSelectorState.loading() );
    if (place != null) {
      moveCamera(place);
      marker = marker.copyWith(positionParam: place);
    }
    emit(const MapSelectorState.loaded());

  }

  void moveCamera(LatLng latLng) {
    cameraPosition = CameraPosition(target: latLng, zoom: 15);
  }
}
