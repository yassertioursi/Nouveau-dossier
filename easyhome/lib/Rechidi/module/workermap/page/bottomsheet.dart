part of 'index.dart';

class _BottomSheet extends StatelessWidget {
  const _BottomSheet(this._post);

  final PostCard _post;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _post.title,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.orange,
          ),
        ),
        _buildDivider(),
        Text(
          _post.description,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.primary,
          ),
        ),
        _buildApplyButton(),
      ],
    );
  }

  Widget _buildApplyButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      // width: 80.w,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Text(
          'Apply',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      height: 2.h,
      width: 80.w,
      color: Colors.grey,
    );
  }
}
