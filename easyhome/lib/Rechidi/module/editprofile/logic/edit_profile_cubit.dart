import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easyhome/Rechidi/core/helper/validator.dart';
import 'package:easyhome/Rechidi/models/user.dart';
import 'package:easyhome/Rechidi/models/woker.dart';
import 'package:easyhome/Rechidi/module/editprofile/data/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_profile_state.dart';
part 'edit_profile_cubit.freezed.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileRepository _repository;
  EditProfileCubit(
      {required UserEntity user, required EditProfileRepository repository})
      : _user = user,
        _repository = repository,
        super(const EditProfileState.initial()) {
    name.text = user.name ?? '';
    bio.text = user.bio ?? '';
    phone.text = user.phone ?? '';
    email.text = user.email ?? '';
    facebook.text = user.facebook ?? '';
    wilaya.text = user.willaya ?? '';
    if (user is WorkerEntity) job.text = user.job ?? '';
  }

  final UserEntity _user;

  final name = TextEditingController();
  final bio = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final facebook = TextEditingController();
  final wilaya = TextEditingController();
  final job = TextEditingController();

  final _picker = ImagePicker();
  File? _image;

  void deleteImage() {
    emit(const EditProfileState.imagePicking());
    _image = null;
    emit(const EditProfileState.imagePicked());
  }

  ImageProvider get image {
    if (_image != null) return FileImage(_image!);
    return NetworkImage(_user.profilePicture ?? '');
  }

  void pickImage(ImageSource source) async {
    emit(const EditProfileState.imagePicking());

    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }

    emit(const EditProfileState.imagePicked());
  }

  Future<void> submit() async {
    emit(const EditProfileState.submitting());

    final checks = [
      name.text.isName(),
      phone.text.isPhoneNumber(),
      email.text.isEmail(),
    ];

    for (final check in checks) {
      if (check is InvalidResult) {
        return emit(EditProfileState.error(check.message));
      }
    }

    try {
      await _repository.editProfile(
        name: name.text,
        bio: bio.text,
        phoneNumber: phone.text,
        email: email.text,
        facebook: facebook.text,
        wilaya: wilaya.text,
        job: job.text,
        profilePicture: _image,
      );
    } on DioException catch (e) {
      return emit(EditProfileState.error(
          e.response?.data?['message'] ?? 'An error occurred'));
    }

    emit(const EditProfileState.submitted());
  }
}
