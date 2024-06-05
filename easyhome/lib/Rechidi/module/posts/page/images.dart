part of 'index.dart';

class _Images extends StatelessWidget {
  const _Images();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PortfolioPostCrudCubit>();
    return Column(
      children: [
        const _BuildImages(),
        height(20),
        _buildPickImage(
          onGalleryPick: () => cubit.setImage(ImageSource.gallery),
          onCameraPick: () => cubit.setImage(ImageSource.camera),
        )
      ],
    );
  }

  Widget _buildPickImage({
    required VoidCallback onGalleryPick,
    required VoidCallback onCameraPick,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        children: [
          Expanded(
            child: _buildPickImageButton(
              icon: Icons.photo_library,
              title: 'Gallery',
              onTap: onGalleryPick,
            ),
          ),
          width(20),
          Expanded(
            child: _buildPickImageButton(
              icon: Icons.camera_alt,
              title: 'Camera',
              onTap: onCameraPick,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPickImageButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 30.sp,
            ),
            height(5),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildImages extends StatelessWidget {
  const _BuildImages();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioPostCrudCubit, PortfolioPostCrudState>(
      builder: (context, state) {
        final cubit = context.read<PortfolioPostCrudCubit>();
        final images = cubit.images;
        if (images.isEmpty) {
          return const SizedBox();
        }
        return SizedBox(
          height: 320.h,
          child: PageView.builder(
            itemCount: cubit.images.length,
            itemBuilder: (context, index) => _buildImage(
                image: cubit.images[index],
                onDelete: (ImageProvider x) {
                  if (x is FileImage) {
                    cubit.removeLocalImage(x.file);
                  } else if (x is NetworkImage) {
                    cubit.removeNetworkImage(x.url);
                  }
                }),
          ),
        );
      },
    );
  }

  Widget _buildImage({
    required ImageProvider image,
    required void Function(ImageProvider) onDelete,
  }) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.grey, width: 2),
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 10.h,
          right: 35.w,
          child: InkWell(
            onTap: () => onDelete(image),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
