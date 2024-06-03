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

Widget _buildBio() {
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
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Column(
        children: [
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
          _infoItems(Icons.mail_outline, userDetails.data?.email ?? ''),
          _infoItems(Icons.phone, userDetails.data?.phoneNumber ?? ''),
          _infoItems(Icons.facebook, userDetails.data?.facebook ?? ''),
        ],
      ),
    ),
  );
}

Widget _infoItems(IconData icon, String title) {
  return Padding(
    padding: EdgeInsets.fromLTRB(14.w, 5.h, 0, 0),
    child: Row(
      children: [
        Icon(
          icon,
          color: MyColors.mainblue,
          size: 25.w,
        ),
        Container(
          width: 10.w,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 57, 64, 68)),
        )
      ],
    ),
  );
}

List<Widget> _infos(User userDetails) {
  return [
    _buildName(userDetails.data?.name ?? ''),
    _buildBio(),
    _contact(),
  ];
}
