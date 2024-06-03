import 'dart:async';
import 'dart:collection';

import 'package:easyhome/Rechidi/core/extension/latlang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../../../../core/constants/statics.dart';
import '../../../../core/helper/location.helper.dart';
import '../data/repo/repo.dart';
import '../data/src/source.dart';

part 'map_state.dart';
part 'map_cubit.freezed.dart';

class ShowMapCubit extends Cubit<MapState> {
  ShowMapCubit(this._repository) : super(const MapState.initial());

  Completer<GoogleMapController> controller = Completer();

  Circle get circle => Circle(
        circleId: const CircleId('ME'),
        center: _myLocation,
        radius: _radius * 1000,
        fillColor: const Color.fromARGB(255, 64, 100, 97).withOpacity(0.2),
        strokeColor: const Color.fromARGB(255, 64, 100, 97),
        strokeWidth: 1,
      );

  final LocationRepository _repository;
  double _radius = 0;
  double get radius => _radius;

  final CameraPosition _position =
      const CameraPosition(target: LatLng(35.2053765, -0.7137929), zoom: 15);

  CameraPosition get cameraPosition => _position;

  final List<WorkerCard> _workers = [];
  LatLng _myLocation = const LatLng(0, 0);

  Future<void> setMyLocation({LatLng? place}) async {
    emit(const MapState.setRadiusLoading());
    if (place == null) {
      final x = await LocationHelper.getCurrentLocation();
      _myLocation = LatLng(x.latitude, x.longitude);
    } else {
      _myLocation = place;
    }
    await fetchWorkerList();
    emit(const MapState.setRadiusSuccess());
  }

  HashSet<Marker> markerList({
    required void Function(WorkerCard) showInfo,
  }) =>
      HashSet.from([
        ..._workers.map((e) {
          return e.location!.marker.copyWith(onTapParam: () => showInfo(e));
        }),
        _myLocation.toMarker(),
      ]);

  Future<void> fetchWorkerList() async {
    emit(const MapState.fetchingWorkers());
    final result = await _repository.getLocations(
      lat: _myLocation.latitude,
      long: _myLocation.longitude,
      radius: _radius * 1000,
      job: _job,
    );

    _workers.clear();
    _workers.addAll(result);

    emit(const MapState.fetchWorkersListSuccess());
  }

  String? _job;
  set job(String job) {
    emit(const MapState.setJobLoading());
    jobList.update(job, (value) => !value);
    if (_job != null) jobList.update(_job!, (_) => false);

    if (job == _job) {
      _job = null;
    } else {
      _job = job;
    }
    emit(const MapState.setJobSuccess());
    fetchWorkerList();
  }

  final Map<String, bool> jobList = {for (var e in StaticStuf.jobs) e: false};

  Future<void> updateRadius(double radius) async {
    emit(const MapState.setRadiusLoading());
    _radius = radius;
    emit(const MapState.setRadiusSuccess());
    await fetchWorkerList();
  }

  Future<void> moveCamera(LatLng latLng) async {
    (await controller.future).animateCamera(CameraUpdate.newLatLng(latLng));
  }
}
