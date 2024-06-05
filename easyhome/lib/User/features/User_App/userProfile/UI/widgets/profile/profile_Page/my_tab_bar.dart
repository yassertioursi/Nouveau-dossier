import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget myTabBar() {
  return Padding(
    padding: EdgeInsets.only(top: 20.h),
    child: Column(children: [
      Container(
        color: MyColors.mainblue,
        child: TabBar(
          
          padding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.white,
          indicatorWeight: 4,
          labelStyle: TextStyle(
            fontSize: 17.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
              fontSize: 15.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
          tabs: const [
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Tab(
                text: "Posts",
              ),
            ),
            Tab(
              text: "Favorite Workers",
            ),
          ],
        ),
      ),
    ]),
  );
}
