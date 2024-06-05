import 'package:easyhome/Rechidi/core/extension/bottomsheet.dart';
import 'package:easyhome/Rechidi/core/shared/spacing.dart';
import 'package:easyhome/Rechidi/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        context.showBottomSheet(page: const _Bottom());
      },
      child: const Text('Test'),
    ));
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildProfilePic('ImgUrl'),
            width(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildName('Rechidi Ahmed'),
                _buildWillaya('El Bayadh'),
              ],
            ),
            const Spacer(),
            _buildCallButton(call: () {}),
          ],
        ),
        _divider(),
        _buildTitle('Looking for cleaning service'),
        _divider(width: 50),
        _buildDescription(
          'I need someone to clean my house, it is a small house with 2 rooms and a kitchen. I need someone to clean my house, it is a small house with 2 rooms and a kitchen. I need someone to clean my house, it is a small house with 2 rooms and a kitchen.',
        ),
        height(12),
        _buildApplyButton(apply: () {}),
      ],
    );
  }

  Widget _buildApplyButton({required void Function() apply}) {
    return ElevatedButton(
      onPressed: apply,
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
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      description,
      style: TextStyle(
        fontSize: 14.sp,
        color: AppColors.primary.withOpacity(0.8),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.start,
      maxLines: 3,
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.orange,
      ),
    );
  }

  Widget _divider({double? width}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      height: 2.h,
      width: (width ?? 120).w,
      color: AppColors.grey,
    );
  }

  Widget _buildCallButton({required void Function() call}) {
    return IconButton(
      onPressed: call,
      icon: Icon(
        Icons.call,
        color: AppColors.primary,
        size: 30.sp,
      ),
    );
  }

  Widget _buildWillaya(String willaya) {
    return Text(
      willaya,
      style: TextStyle(
        fontSize: 14.sp,
        color: AppColors.primary,
      ),
    );
  }

  Text _buildName(String name) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildProfilePic(String imgUrl) {
    return Container(
      height: 70.r,
      width: 70.r,
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
