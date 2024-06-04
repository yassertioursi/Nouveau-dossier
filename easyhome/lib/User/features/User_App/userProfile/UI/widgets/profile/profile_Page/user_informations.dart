// ignore_for_file: prefer_const_constructors

import 'package:easyhome/User/features/User_App/userProfile/UI/screens/user_profile_screen.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/user.dart';
import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget userInformations(User userDetails) {
  return Column(
    children: _infos(userDetails),
  );
}

Widget _buildName(String name) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Text(
      name,
      style: TextStyle(
          fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _buildBio(User userdetails) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: RichText(
            text: TextSpan(
                text: userDetails.data?.bio ?? '',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color.fromRGBO(117, 117, 117, 0.91),
                    fontWeight: FontWeight.w500))),
      )
    ],
  );
}

Widget _contact() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black,
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.place_rounded,
                        color: MyColors.mainblue,
                        size: 25.sp,
                      ),
                      Text(
                        userDetails.data?.wilaya ?? "",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 360.w,
              padding: EdgeInsets.fromLTRB(8, 10.h, 0, 4),
              child: Center(
                child: Text(
                  'Contacts ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w600,
                      color: MyColors.mainorange),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _infoItems(Icons.mail, userDetails.data?.email ?? ''),
                  _infoItems(Icons.phone, userDetails.data?.phoneNumber ?? ''),
                  if (userDetails.data?.facebook?.isEmpty == true)
                    _infoItems(
                        Icons.facebook, userDetails.data?.facebook ?? ''),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _infoItems(IconData icon, String title) {
  return Expanded(
    child: Column(
      children: [
        if (title.isNotEmpty)
          Icon(
            icon,
            color: MyColors.mainblue,
            size: 25.w,
          ),
        if (title.isNotEmpty)
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
      ],
    ),
  );
}

List<Widget> _infos(User userDetails) {
  return [
    _buildName(userDetails.data?.name ?? ''),
    _buildBio(userDetails),
    _contact(),
  ];
}
