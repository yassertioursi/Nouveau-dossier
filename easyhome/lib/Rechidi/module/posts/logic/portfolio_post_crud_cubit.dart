import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easyhome/Rechidi/models/portfoliopost.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../data/source.dart';

part 'portfolio_post_crud_state.dart';
part 'portfolio_post_crud_cubit.freezed.dart';

class PortfolioPostCrudCubit extends Cubit<PortfolioPostCrudState> {
  final PostDataSource _remote;
  PortfolioPostCrudCubit(
    this._remote, {
    PortfolioPostEntity? post,
  })  : _post = post,
        super(const PortfolioPostCrudState.initial()) {
    if (post != null) {
      description.text = post.description ?? '';
    }
  }

  final PortfolioPostEntity? _post;
  final description = TextEditingController();
  final List<File> _images = [];
  final List<String> _deletedImages = [];
  final _picker = ImagePicker();

  List<ImageProvider> get images {
    final local = _images.map((e) => FileImage(e)).toList();
    final network = _post?.images.map((e) => NetworkImage(e)).toList() ?? [];
    return [...local, ...network];
  }

  Future<void> setImage(ImageSource source) async {
    emit(const PortfolioPostCrudState.imageChanging());
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _images.add(File(pickedFile.path));
    }
    emit(const PortfolioPostCrudState.imageChanged());
  }

  void removeLocalImage(File image) {
    emit(const PortfolioPostCrudState.imageChanging());
    _images.remove(image);
    emit(const PortfolioPostCrudState.imageChanged());
  }

  void removeNetworkImage(String image) {
    emit(const PortfolioPostCrudState.imageChanging());
    _post?.images.remove(image);
    _deletedImages.add(image);
    emit(const PortfolioPostCrudState.imageChanged());
  }

  Future<void> savePost() async {
    emit(const PortfolioPostCrudState.saving());

    if (description.text.isEmpty) {
      return emit(
          const PortfolioPostCrudState.error('Description is required'));
    }

    late PortfolioPostEntity newPost;
    try {
      if (_post != null) {
        final newDescription =
            description.text == _post?.description ? null : description.text;
        final response = await _remote.updatePost(
          _post!.id!,
          newDescription,
          _deletedImages,
          _images,
        );

        newPost = response.portfolioPost;
      } else {
        final response = await _remote.createPost(description.text, _images);
        newPost = response.portfolioPost;
      }
    } on DioException catch (e) {
      emit(PortfolioPostCrudState.error(e.response?.data['message'] ?? ''));
    }

    await Future.delayed(const Duration(seconds: 2));
    emit(PortfolioPostCrudState.saved(newPost));
  }
}
