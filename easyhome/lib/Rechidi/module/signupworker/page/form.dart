part of 'index.dart';

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: BlocBuilder<SignUpWorkerCubit, SignUpWorkerState>(
        builder: (context, state) {
          final cubit = context.read<SignUpWorkerCubit>();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title("Job"),
              _selectJobField(cubit.jobController),
              height(20),
              _title("Wilaya"),
              _selectWilayaField(cubit.wilayaController),
              height(20),
              _title('Location'),
              _locationField(
                  controller: cubit.locationController,
                  location: cubit.location,
                  onTap: () async {
                    final location = await context
                        .to<LocationEntity>(const MapPlaceSelector());
                    cubit.setLocation(location);
                  }),
              height(20),
              _title("Identity"),
              _uploadIDButton(cubit.idImage, () => cubit.uploadID()),
              height(20),
            ],
          );
        },
      ),
    );
  }

  Widget _locationField({
    required TextEditingController controller,
    LocationEntity? location,
    required void Function() onTap,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Your location Name (Ex : SoftShop , ...)',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: onTap,
          padding: EdgeInsets.zero,
          icon: Icon(
              location != null
                  ? Icons.location_on_rounded
                  : Icons.location_on_outlined,
              size: 45.r),
        ),
      ],
    );
  }

  Widget _uploadIDButton(String idImage, void Function() uploadID) {
    return ElevatedButton(
      onPressed: uploadID,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
              idImage == 'Upload ID'
                  ? CupertinoIcons.photo_camera
                  : CupertinoIcons.checkmark,
              color: AppColors.textPrimary),
          width(10),
          Container(
            constraints: BoxConstraints(maxWidth: 200.w),
            child: Text(
              idImage,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _title(String title) {
    return Text(
      "   $title",
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _selectWilayaField(TextEditingController controller) {
    return AppDropDown(
      items: StaticStuf.wilayas,
      textEditingController: controller,
      hintText: 'Select your Wilaya',
    );
  }

  Widget _selectJobField(TextEditingController controller) {
    return AppDropDown(
      items: StaticStuf.jobs,
      textEditingController: controller,
      hintText: 'Select your Job',
    );
  }
}
