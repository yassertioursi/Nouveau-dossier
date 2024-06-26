import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/screens/worker_profile_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget workerInformations() {
  return Column(
    children: _infos(),
  );
}

Widget _buildName() {
  return Center(
    child: RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
          color: Mycolors.myBlue,
        ),
        children: [
          // TextSpan(text: 'Ameur'),
          TextSpan(text: workerDetails?.worker?.name ?? "unknown"),
        ],
      ),
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
                text: workerDetails?.worker?.bio,
                style: TextStyle(
                    fontSize: 15.sp,
                    color: const Color.fromRGBO(7, 7, 7, 0.61),
                    fontWeight: FontWeight.w500))),
      )
    ],
  );
}

Widget _contact() {
  return Column(
    children: [
      Container(
        width: 360.w,
        padding: EdgeInsets.fromLTRB(8, 20.h, 0, 4),
        child: Text(
          'Info ',
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 27.sp,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 66, 75, 100)),
        ),
      ),
    ],
  );
}

Widget _infoItems(IconData icon, String title) {
  return Padding(
    padding: EdgeInsets.fromLTRB(14.w, 5.h, 0, 0),
    child: Row(
      children: [
        Icon(
          icon,
          color: Mycolors.myOrange,
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

List<Widget> _infos() {
  return [
    _buildName(),
    _buildBio(),
    _contact(),
    _infoItems(Icons.work, workerDetails?.worker?.job ?? ''),
    _infoItems(Icons.location_city, workerDetails?.worker?.wilaya ?? ''),
    _infoItems(Icons.mail, workerDetails?.worker?.email ?? ''),
    _infoItems(Icons.phone, workerDetails?.worker?.phoneNumber ?? ''),
    _infoItems(Icons.facebook, workerDetails?.worker?.name ?? ''),
  ];
}
