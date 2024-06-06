part of 'index.dart';

class _WorkerInfo extends StatelessWidget {
  const _WorkerInfo();

  @override
  Widget build(BuildContext context) {
    final worker = context.watch<WorkerProfileCubit>().worker!;
    return Container(
      height: 230.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 22.w),
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.primary, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfoItem(Icons.work, worker.job!),
              _buildInfoItem(Icons.location_on, worker.willaya!),
            ],
          ),
          _buildTitle('Contact'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildContactItem(Icons.facebook, worker.facebook ?? 'N/A'),
              _buildContactItem(Icons.phone, worker.phone!),
              _buildContactItem(Icons.email, worker.email!),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return SizedBox(
      width: 85.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 40.sp),
          height(10),
          Text(
            text,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.orange,
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 35.sp),
          Expanded(
            child: Text(
              text,
              maxLines: 2,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
