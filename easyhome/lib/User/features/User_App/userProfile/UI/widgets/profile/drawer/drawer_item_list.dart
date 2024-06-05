import 'package:easyhome/Rechidi/core/extension/navigation.dart';
import 'package:easyhome/Rechidi/models/user.dart';
import 'package:easyhome/Rechidi/module/editprofile/page/index.dart';
import 'package:easyhome/Rechidi/module/signupworker/page/index.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/profile/drawer/drawer_items.dart';

import 'package:easyhome/User/features/User_App/userProfile/data/model/user.dart';
import 'package:easyhome/Worker/features/Worker_App/All_4_features.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerItemList extends StatefulWidget {
  const DrawerItemList({super.key, required this.user});
  final User user;

  @override
  State<DrawerItemList> createState() => _DrawerItemListState();
}

class _DrawerItemListState extends State<DrawerItemList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: drawerItemsList(widget.user),
    );
  }

  List<Widget> drawerItemsList(User user) {
    return [
      const drawerHeader(),
      SizedBox(
        height: 10.h,
      ),
      drawerItem(
          //  this function switch the user to worker 3 cases
          myicon: Icons.work,
          text: "Switch To worker",
          function: () {
            if (user.user!.workerAcountVerified!) {
              context.to(const Home_Worker());
            } else if (user.user?.role == "Worker") {
              showCustomSnackBar();
            } else {
              context.to(const SignUpWorkerPage());
            }
          }),
      Divider(
        thickness: 0.8,
        endIndent: 16.sp,
        indent: 16.sp,
        color: Colors.black,
      ),
      drawerItem(
          //
          myicon: Icons.edit,
          text: "Edit Profile",
          function: () {
            context.to(EditProfile(worker: UserEntity.fromUser(widget.user)));
          }),
      Divider(
        thickness: 0.8.sp,
        endIndent: 16,
        indent: 16,
        color: Colors.black,
      ),
      drawerItem(
        myicon: Icons.logout,
        text: "Log Out",
      )
    ];
  }

  void showCustomSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.report_gmailerrorred_rounded,
              color: Colors.white,
              size: 25.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              'Your account is not verfied yet.',
              style: TextStyle(color: Colors.white, fontSize: 15.sp),
            ),
          ],
        ),
        backgroundColor: const Color(0xffff0f0f),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
