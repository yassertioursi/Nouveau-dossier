import 'package:easyhome/User/features/User_App/userProfile/UI/screens/user_profile_screen.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/user.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget drawerItem(
    {required IconData myicon,
    required String text,
    VoidCallback? onTap,
    BuildContext? context}) {
  return InkWell(
    onTap: onTap,
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
        color: MyColors.mainblue,
      ),
      width: double.infinity,
      height: 200.h,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
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
                  height: 80.sp,
                  width: 80.sp,
                  child: Image.asset("lib/utils/images/default.jpg")),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              user?.user?.name ?? 'unknown',
              style: TextStyle(color: Colors.white, fontSize: 20.sp),
            ),
          ),
          Text(
            user?.user?.email ?? 'unknown@gmail.com',
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
