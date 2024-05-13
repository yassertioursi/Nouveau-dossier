import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget avatarCircle(BuildContext context) {
  return Stack(children: [
    Padding(
      padding: EdgeInsets.only(top: 20.sp),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black54, width: 2.w),
              borderRadius: BorderRadius.circular(100)),
          //THE CIRCLE
          child: CircleAvatar(
            radius: 59.sp,
            child: Icon(
              Icons.person,
              size: 100.sp,
            ),
          ),
        ),
      ),
    ),
    _buildEditButton(context),
  ]);
}

Widget _buildEditButton(BuildContext context) {
  return Padding(
      padding: EdgeInsets.only(top: 120.sp),
      child: Center(
        child: CircleAvatar(
          radius: 20.sp,
          backgroundColor: Mycolors.myOrange,
          child: IconButton(
            icon: Icon(
              Icons.edit,
              color: Mycolors.myBlue,
              size: 25.sp,
            ),
            onPressed: () {},
          ),
        ),
      ));
}
