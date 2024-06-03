part of 'index.dart';

class _BottomSheet extends StatelessWidget {
  const _BottomSheet(this._location);

  final LocationEntity _location;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.back();
        context.back(_location);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
      ),
      child: Text(
        "This is my location",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
