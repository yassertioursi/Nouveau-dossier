import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:easyhome/Rechidi/core/helper/validator.dart';
import 'package:easyhome/Rechidi/models/certificate.dart';
import 'package:easyhome/Rechidi/module/certificate/data/src/source.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'certifcate_crud_state.dart';
part 'certifcate_crud_cubit.freezed.dart';

class CertifcateCrudCubit extends Cubit<CertifcateCrudState> {
  final CertificateSource _remote;
  CertifcateCrudCubit(this._remote, {CertificateEntity? certificate})
      : _certificate = certificate,
        super(const CertifcateCrudState.initial()) {
    title.text = _certificate?.title ?? '';
  }

  final CertificateEntity? _certificate;
  final title = TextEditingController();
  final _picker = ImagePicker();

  File? _image;

  ImageProvider? get image {
    if (_image != null) {
      return FileImage(_image!);
    }
    if (_certificate?.imageUrl != null && _certificate?.imageUrl != '') {
      return NetworkImage(_certificate!.imageUrl!);
    }
    return null;
  }

  void removeImage() {
    emit(const CertifcateCrudState.loading());
    _image = null;
    emit(const CertifcateCrudState.loaded());
  }

  Future<void> setImage() async {
    emit(const CertifcateCrudState.loading());
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
    emit(const CertifcateCrudState.loaded());
  }

  Future<void> saveCertificate() async {
    emit(const CertifcateCrudState.saving());

    if (title.text.isTitle() is InvalidResult) {
      return emit(const CertifcateCrudState.error('Title is required'));
    }
    if (_image == null && _certificate?.imageUrl == null) {
      return emit(const CertifcateCrudState.error('Image is required'));
    }

    final response = await _remote.createCertificate(title.text, _image!);
    final result = response.certificate;

    emit(CertifcateCrudState.saved(result));
  }
}
