import 'package:easyhome/User/features/User_App/userProfile/data/model/user.dart';
import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildUperProfile(
    GlobalKey<ScaffoldState> key, BuildContext context, User userDetails) {
  return SafeArea(
    child: Stack(
      children: [
        _buildBackground(),
        _buildDrawer(key, userDetails),
        _buildAvatar(context, userDetails),
      ],
    ),
  );
}

Widget _buildDrawer(GlobalKey<ScaffoldState> key, User userDetails) {
  return Positioned(
    right: 0,
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 8),
      child: IconButton(
          onPressed: () {
            key.currentState!.openEndDrawer();
          },
          icon: Icon(
            Icons.format_list_bulleted,
            size: 35.sp,
            color: Mycolors.myWhite,
          )),
    ),
  );
}

Widget _buildBackground() {
  return Column(
    children: [
      Container(
        height: 180.h,
        decoration: const BoxDecoration(
          color: MyColors.mainblue,
          // borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(30),
          //     bottomRight: Radius.circular(30))
        ),
      ),
      _buildPhoneCall(),
    ],
  );
}

Widget _buildPhoneCall() {
  return Container(
    height: 0.h,
  );
}

Widget _buildAvatar(BuildContext context, User userDetails) {
  return Padding(
    padding: EdgeInsets.only(top: 120.h),
    //ORANGE BORDER
    child: Center(child: profilepic(userDetails.user?.profilePicture, true)),
  );
}

Widget profilepic(String? pic, bool big) {
  return ClipOval(
      child: Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.white,
        width: 7,
      ),
    ),
    child: ClipOval(
      child: SizedBox(
        height: 120.sp,
        width: 120.sp,
        child: pic == null || pic == '' || pic == 'default.jpg'
            ? Image.asset("lib/utils/images/default.jpg")
            : Image.network(
                pic,
                fit: BoxFit.fill,
              ),
      ),
    ),
  ));
}
