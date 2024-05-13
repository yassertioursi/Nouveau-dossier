import 'package:easyhome/User/features/User_App/userProfile/data/model/user.dart';
import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
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
    child: IconButton(
        onPressed: () {
          key.currentState!.openEndDrawer();
        },
        icon: Icon(
          Icons.format_list_bulleted,
          size: 40.sp,
          color: Mycolors.myWhite,
        )),
  );
}

Widget _buildBackground() {
  return Column(
    children: [
      Container(
        height: 180.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Colors.blue,
                Color.fromARGB(255, 87, 15, 219),
                Colors.purple
              ]),
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
    height: 79.h,
  );
}

Widget _buildAvatar(BuildContext context, User userDetails) {
  return Padding(
      padding: EdgeInsets.only(top: 120.h),
      //ORANGE BORDER
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Mycolors.myOrange, width: 2.3.w)),
          //WHITE BORDER
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 4.w),
                borderRadius: BorderRadius.circular(100)),
            //THE CIRCLE
            child: CircleAvatar(
                radius: 59.sp,
                child: profilepic(userDetails.data?.profilePicture, true)),
          ),
        ),
      ));
}

Widget profilepic(String? pic, bool big) {
  if (pic == null || pic == '' || pic == 'default.jpg') {
    if (big) {
      return Icon(
        Icons.person,
        size: 100.sp,
      );
    } else {
      return Icon(Icons.person, size: 40.sp);
    }
  } else {
    return Image.network(
      pic,
      fit: BoxFit.fill,
    );
  }
}
