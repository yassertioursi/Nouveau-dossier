import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/profile/profile_Page/uper_profile.dart';
import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/screens/worker_profile_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildUperProfile(
  GlobalKey<ScaffoldState> key,
  BuildContext context,
) {
  return SafeArea(
    child: Stack(
      children: [
        _buildBackground(),
        _buildDrawer(key),
        _buildAvatar(context),
        if (workerDetails?.worker?.isCertified ?? false)
          _buildVerified(context),

        // _buildCall(context),
      ],
    ),
  );
}

Widget _buildDrawer(GlobalKey<ScaffoldState> key) {
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
      _buildPhoneCall(workerDetails?.worker?.rating ?? 2,
          workerDetails?.worker?.experience ?? 10),
    ],
  );
}

Widget _buildPhoneCall(int rating, int experience) {
  return SizedBox(
    height: 79.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 10.sp,
            top: 15,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.local_fire_department_rounded,
                    size: 25.sp,
                  ),
                  SizedBox(
                    height: 30.h,
                    child: Text(
                      "$experience",
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: Text(
                  "Experience",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 49, 48, 48)),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 35.sp, top: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 30.sp,
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 30.h,
                    child: Text(
                      "$rating",
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              Text(
                "Rating",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 32, 31, 31)),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildAvatar(BuildContext context) {
  return Padding(
      padding: EdgeInsets.only(top: 120.h),
      //ORANGE BORDER
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              border: Border.all(color: Mycolors.myOrange, width: 2.3.w)),
          //WHITE BORDER
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 4.w),
                borderRadius: BorderRadius.circular(100)),
            //THE CIRCLE
            child: CircleAvatar(
                radius: 59.sp,
                child: profilepic(workerDetails?.worker?.profilePicture, true)),
          ),
        ),
      ));
}

Widget _buildVerified(BuildContext context) {
  return Positioned(
      right: MediaQuery.of(context).size.width / 3.sp,
      top: MediaQuery.of(context).size.height / 3.sp,
      child: Icon(
        Icons.verified,
        size: 40.sp,
        color: const Color.fromARGB(255, 75, 9, 87),
      ));
}

// Widget _buildCall(BuildContext context) {
//   return Positioned(
//       right: MediaQuery.of(context).size.width / 2.sp,
//       top: MediaQuery.of(context).size.height / 3.sp,
//       child: Container(
//         margin: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(60),
//           color: Colors.green,
//         ),
//         child: GestureDetector(
//           onTap: () {
//             final DirectCaller directCaller = DirectCaller();
//             directCaller
//                 .makePhoneCall(workerDetails?.worker?.phoneNumber ?? '0');
//           },
//           child: Icon(
//             Icons.call,
//             size: 40.sp,
//             color: Colors.white,
//           ),
//         ),
//       ));
// }
