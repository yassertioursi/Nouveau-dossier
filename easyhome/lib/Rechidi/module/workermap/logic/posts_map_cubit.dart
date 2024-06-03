import 'dart:async';

import 'package:easyhome/Rechidi/core/helper/location.helper.dart';
import 'package:easyhome/Rechidi/module/workermap/data/repository/repository.dart';
import 'package:easyhome/Rechidi/module/workermap/data/src/datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../../../core/constants/statics.dart';

part 'posts_map_state.dart';
part 'posts_map_cubit.freezed.dart';

class PostsMapCubit extends Cubit<PostsMapState> {
  final PostsMapRepository _repository;
  PostsMapCubit(this._repository) : super(const PostsMapState.initial());

  final Completer<GoogleMapController> controller = Completer();

  double raduis = 50;
  LatLng myLocation = const LatLng(35.2053765, -0.7137929);
  CameraPosition cameraPosition =
      const CameraPosition(target: LatLng(35.2053765, -0.7137929), zoom: 15);
  List<PostCard> _posts = [];

  Circle get circle => Circle(
        circleId: const CircleId('ME'),
        center: myLocation,
        radius: raduis * 1000,
        fillColor: const Color.fromARGB(255, 64, 100, 97).withOpacity(0.2),
        strokeColor: const Color.fromARGB(255, 64, 100, 97),
        strokeWidth: 1,
      );

  Set<Marker> markers({
    required void Function(PostCard) showInfo,
  }) =>
      {
        Marker(
          markerId: const MarkerId('Me'),
          position: myLocation,
        ),
        ..._posts
            .map(
              (e) => e.location.marker.copyWith(onTapParam: () => showInfo(e)),
            )
            .toSet(),
      };

  String? _job;
  set job(String job) {
    emit(const PostsMapState.loading());
    jobList.update(job, (value) => !value);
    if (_job != null) jobList.update(_job!, (_) => false);

    if (job == _job) {
      _job = null;
    } else {
      _job = job;
    }
    emit(const PostsMapState.loaded());
  }

  final Map<String, bool> jobList = {for (var e in StaticStuf.jobs) e: false};

  Future<void> fecthPosts() async {
    emit(const PostsMapState.fetchingPosts());
    final posts = await _repository.getPosts(
      lat: myLocation.latitude,
      lng: myLocation.longitude,
      radius: raduis * 1000,
      job: _job,
    );
    _posts = posts;
    emit(const PostsMapState.fetchingPostsSuccess());
  }

  Future<void> setMyLocation({LatLng? place}) async {
    emit(const PostsMapState.loading());
    if (place == null) {
      final x = await LocationHelper.getCurrentLocation();
      place = LatLng(x.latitude, x.longitude);
    }
    myLocation = place;

    emit(const PostsMapState.loaded());
    await fecthPosts();
    await moveCamera(myLocation);
  }

  Future<void> moveCamera(LatLng location) async {
    final GoogleMapController controller = await this.controller.future;
    controller.animateCamera(CameraUpdate.newLatLng(location));
  }

  Future<void> updateRadius(double radius) async {
    emit(const PostsMapState.loading());
    raduis = radius;
    emit(const PostsMapState.loaded());
    await fecthPosts();
    await moveCamera(myLocation);
  }
}
