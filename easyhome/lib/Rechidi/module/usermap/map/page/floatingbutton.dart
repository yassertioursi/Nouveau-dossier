part of 'index.dart';

class _FloatingButton extends StatelessWidget {
  const _FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShowMapCubit>();
    return Padding(
      padding: EdgeInsets.only(bottom: 40.h),
      child: FloatingActionButton(
        onPressed: () async {
          final x = await LocationHelper.getCurrentLocation();
          cubit.moveCamera(LatLng(x.latitude, x.longitude));
        },
        backgroundColor: AppColors.primary,
        child: Icon(Icons.location_searching, size: 28.sp, color: Colors.white),
      ),
    );
  }
}
