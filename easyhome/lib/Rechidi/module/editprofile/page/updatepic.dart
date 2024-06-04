part of 'index.dart';

class _UpdatePic extends StatelessWidget {
  const _UpdatePic();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        final cubit = context.read<EditProfileCubit>();
        final image = cubit.image;
        final pickImage = cubit.pickImage;

        return Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 3),
              ),
              child: CircleAvatar(
                radius: 75.r,
                backgroundImage: image,
              ),
            ),
            // height(10),
            _buildUpdatePicButton(context, pickImage),
            _buildCancelButton(cubit.deleteImage),
          ],
        );
      },
    );
  }

  Widget _buildCancelButton(void Function() deleteImage) {
    return PositionedDirectional(
      top: 0,
      end: 5.h,
      child: GestureDetector(
        onTap: deleteImage,
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
          child: Icon(
            Icons.cancel,
            color: AppColors.primary,
            size: 30.sp,
          ),
        ),
      ),
    );
  }

  GestureDetector _buildUpdatePicButton(
      BuildContext context, void pickImage(ImageSource source)) {
    return GestureDetector(
      onTap: () {
        context.showDialogue(
          title: 'Update Profile Picture',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(
                icon: Icons.camera_alt,
                text: 'Camera',
                onPickImage: pickImage,
                back: () => context.back(),
              ),
              _buildButton(
                icon: Icons.photo,
                text: 'Gallery',
                onPickImage: pickImage,
                back: () => context.back(),
              ),
            ],
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        margin: EdgeInsets.only(bottom: 5.h),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
        ),
        child: Icon(Icons.camera_alt, color: AppColors.primary, size: 30.sp),
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String text,
    required void Function(ImageSource) onPickImage,
    required void Function() back,
  }) {
    final source =
        icon == Icons.camera_alt ? ImageSource.camera : ImageSource.gallery;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, color: AppColors.black, size: 30.sp),
          onPressed: () {
            onPickImage(source);
            back();
          },
        ),
        Text(
          text,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
