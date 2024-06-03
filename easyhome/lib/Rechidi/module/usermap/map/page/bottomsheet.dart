part of 'index.dart';

class _BottomSheet extends StatelessWidget {
  const _BottomSheet(this._worker);

  final WorkerCard _worker;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 100.r,
            width: 100.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
              image: DecorationImage(
                image: NetworkImage(_worker.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        width(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _worker.name!.split('')[0].toUpperCase() +
                  _worker.name!.substring(1),
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
                color: const Color(0xff454545),
                letterSpacing: 1.5,
              ),
            ),
            Text(
              _worker.job!,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.orange,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
