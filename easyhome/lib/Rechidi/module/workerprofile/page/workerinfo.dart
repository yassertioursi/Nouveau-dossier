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
              _buildInfoItem(AppIcons.work, worker.job!),
              _buildInfoItem(AppIcons.location, worker.willaya!),
            ],
          ),
          _buildTitle('Contact'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildContactItem(AppIcons.facebook, worker.facebook ?? 'N/A'),
              _buildContactItem(AppIcons.phone, worker.phoneNumber!),
              _buildContactItem(AppIcons.email, worker.email!),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(String icon, String text) {
    return SizedBox(
      width: 85.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(icon, height: 40.r, width: 40.r),
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

  Widget _buildInfoItem(String icon, String text) {
    return Row(
      children: [
        SvgPicture.asset(icon, height: 40.r, width: 40.r),
        width(10),
        Text(
          text,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
