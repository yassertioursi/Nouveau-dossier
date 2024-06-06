import 'package:easyhome/Rechidi/core/extension/navigation.dart';
import 'package:easyhome/Rechidi/core/extension/snackbar.dart';
import 'package:easyhome/Rechidi/core/injection/index.dart';
import 'package:easyhome/Rechidi/core/shared/spacing.dart';
import 'package:easyhome/Rechidi/core/theme/colors.dart';
import 'package:easyhome/Rechidi/models/certificate.dart';
import 'package:easyhome/Rechidi/module/certificate/logic/certifcate_crud_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEditCertificate extends StatelessWidget {
  const CreateEditCertificate({super.key, CertificateEntity? certificate})
      : _certificate = certificate;

  final CertificateEntity? _certificate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CertifcateCrudCubit( locator(),  certificate: _certificate),
      child: BlocConsumer<CertifcateCrudCubit, CertifcateCrudState>(
        listener: (context, state) {
          state.whenOrNull(
            saved: (certificate) => context.back(certificate),
            error: (message) {
              context.back();
              context.showSnackBarError(message);
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<CertifcateCrudCubit>();

          return Scaffold(
            appBar: AppBar(
              title: Text(_certificate == null
                  ? 'Add Certificate'
                  : 'Edit Certificate'),
            ),
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      height(20),
                      _buildTitleField(controller: cubit.title),
                      height(20),
                      _buildImageField(
                        image: cubit.image,
                        setImage: cubit.setImage,
                        removeImage: cubit.removeImage,
                      ),
                      height(20),
                      _buildSaveButton(
                        onSave: () {
                          cubit.saveCertificate();
                        },
                        isSaving: state.maybeWhen(
                            orElse: () => false, saving: () => true),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSaveButton({
    required void Function() onSave,
    required bool isSaving,
  }) {
    return isSaving
        ? const CircularProgressIndicator(color: AppColors.primary)
        : InkWell(
            onTap: onSave,
            child: Container(
              width: 100.w,
              padding: EdgeInsets.symmetric(vertical: 7.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
  }

  Widget _buildImageField({
    required ImageProvider? image,
    required void Function() setImage,
    required void Function() removeImage,
  }) {
    return Column(
      children: [
        Container(
          height: 250.h,
          width: 270.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.grey),
            image: DecorationImage(
              image: image ?? const AssetImage('assets/images/placeholder.png'),
              fit: BoxFit.contain,
            ),
          ),
          child: image == null
              ? IconButton(
                  onPressed: setImage,
                  icon: Icon(Icons.add_a_photo, size: 50.sp),
                )
              : Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: removeImage,
                    icon: Icon(Icons.delete, size: 25.sp, color: Colors.red),
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildTitleField({required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Title',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }
}
