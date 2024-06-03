
import 'package:easyhome/Rechidi/core/extension/navigation.dart';
import 'package:easyhome/Rechidi/core/extension/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../core/injection/index.dart';
import '../../../core/shared/dropdownsearchable.dart';
import '../../../core/shared/spacing.dart';
import '../../../core/theme/colors.dart';
import '../../../models/location.dart';
import '../../usermap/selectplace/page/index.dart';
import '../data/repository.dart';
import '../logic/sign_up_worker_cubit.dart';

part 'scaffold.dart';
part 'form.dart';
part 'submitbutton.dart';
part 'logo.dart';

class SignUpWorkerPage extends StatelessWidget {
  const SignUpWorkerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpWorkerCubit(locator<WorkerSignUpRepository>()),
      child: BlocListener<SignUpWorkerCubit, SignUpWorkerState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) {
              context.showSnackBarError(message);
            },
          );
        },
        child: const _Scaffold(
          logo: _Logo(),
          form: _Form(),
          submitButton: _SubmitButton(),
        ),
      ),
    );
  }
}


// job , Pic Id , Location , Certs 