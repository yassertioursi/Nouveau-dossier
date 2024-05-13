import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget myTabBar() {
  return Padding(
    padding: EdgeInsets.only(top: 20.h),
    child: Column(children: [
      TabBar(
        padding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.black,
        labelStyle: TextStyle(
          fontSize: 19.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
            fontSize: 15.sp,
            color: const Color.fromARGB(255, 34, 34, 34),
            fontWeight: FontWeight.w500),
        tabs: const [
          Tab(
            text: "Posts",
          ),
          Tab(
            text: "Favorite Workers",
          ),
        ],
      ),
    ]),
  );
}
