import 'package:easyhome/User/features/User_App/userProfile/UI/screens/user_profile_screen.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/user.dart';
import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget drawerItem(
    {required IconData myicon,
    required String text,
    VoidCallback? function,
    BuildContext? context}) {
  return InkWell(
    onTap: function,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 14.sp),
      child: Row(
        children: [
          Expanded(
            child: Icon(
              myicon,
              size: 20,
              color: Colors.black,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class drawerHeader extends StatefulWidget {
  const drawerHeader({super.key});

  @override
  State<drawerHeader> createState() => _drawerHeaderState();
}

User? user;

class _drawerHeaderState extends State<drawerHeader> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      user = userDetails;
    });
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Mycolors.myBlue, Mycolors.myOrange]),
      ),
      width: double.infinity,
      height: 200.h,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 32.sp,
            child: Icon(
              Icons.person,
              size: 50.sp,
            ),
          ),
          Text(
            user?.data?.name ?? 'unknown',
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
          Text(
            user?.data?.email ?? 'unknown@gmail.com',
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
