import 'package:easyhome/Rechidi/core/shared/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension BottomSheetExtension on BuildContext {
  void showBottomSheet({
    required Widget page,
  }) {
    showModalBottomSheet(
      context: this,
      builder: (_) => Wrap(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Column(
              children: [
                height(20),
                Container(
                  width: 70.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffA2a2a2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                height(20),
                page,
                height(13),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
