import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/screens/worker_profile_sceen.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/worker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget drawerItem(
    {required IconData myicon, required String text, VoidCallback? function}) {
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

MyWorker? worker;

class _drawerHeaderState extends State<drawerHeader> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      worker = workerDetails;
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
            worker?.worker?.name ?? "Unknown",
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
          Text(
            worker?.worker?.email ?? "unknown@gmail.com",
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
