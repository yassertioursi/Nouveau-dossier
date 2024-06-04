import 'package:easyhome/Rechidi/core/constants/statics.dart';
import 'package:easyhome/Rechidi/core/extension/dialogue.dart';
import 'package:easyhome/Rechidi/core/extension/navigation.dart';
import 'package:easyhome/Rechidi/core/extension/snackbar.dart';
import 'package:easyhome/Rechidi/core/injection/index.dart';
import 'package:easyhome/Rechidi/core/shared/spacing.dart';
import 'package:easyhome/Rechidi/core/theme/colors.dart';
import 'package:easyhome/Rechidi/models/woker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../logic/edit_profile_cubit.dart';

part 'scaffold.dart';
part 'updatepic.dart';
part 'personalinfo.dart';
part 'workinfo.dart';
part 'submitbutton.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key, required WorkerEntity worker})
      : __worker = worker;

  final WorkerEntity __worker;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(
        worker: __worker,
        repository: locator(),
      ),
      child: BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) => context.showSnackBarError(message),
            submitted: () => context.back(),
          );
        },
        child: const _Scaffold(
          updatePic: _UpdatePic(),
          personalInfo: _PersonalInfo(),
          workInfo: _WorkInfo(),
          submitButton: _SubmitButton(),
        ),
      ),
    );
  }
}
