import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/location.dart';
import '../data/repository.dart';

part 'sign_up_worker_state.dart';
part 'sign_up_worker_cubit.freezed.dart';

class SignUpWorkerCubit extends Cubit<SignUpWorkerState> {
  SignUpWorkerCubit(this._webService)
      : super(const SignUpWorkerState.initial());

  final WorkerSignUpRepository _webService;

  FileImage? _idImage;
  LocationEntity? location;
  final TextEditingController wilayaController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final _picker = ImagePicker();

  String get idImage =>
      _idImage?.file.path.split(Platform.pathSeparator).last ?? 'Upload ID';

  Future<void> uploadID() async {
    emit(const SignUpWorkerState.uploadingID());
    final selected = await _picker.pickImage(source: ImageSource.camera);
    if (selected != null) {
      _idImage = FileImage(File(selected.path));
    }

    emit(const SignUpWorkerState.uploadedID());
  }

  void setLocation(LocationEntity? location) {
    emit(const SignUpWorkerState.selectingLocation());
    this.location = location;
    emit(const SignUpWorkerState.selectedLocation());
  }

  Future<void> submit() async {
    emit(const SignUpWorkerState.submitting());

    if (location == null) {
      emit(const SignUpWorkerState.error("Please select a location"));
      return;
    }
    if (_idImage == null) {
      emit(const SignUpWorkerState.error("Please upload your ID"));
      return;
    }
    if (jobController.text.isEmpty) {
      emit(const SignUpWorkerState.error("Please enter your job"));
      return;
    }

    await _webService.signUpWorker(
      WorkerSignUpRequest(
        job: jobController.text,
        idPic: _idImage!,
        location: location!,
      ),
    );

    emit(const SignUpWorkerState.submitted());
  }
}
