import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/edit_profile/changePassword/confirm_paswword.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/edit_profile/changePassword/password_text_fields.dart';
import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(context),
      body: _buildBody(context),
    );
  }
}

AppBar _myAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back),
    ),
    title: Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: Text(
        "Change Password",
        style: TextStyle(
            fontSize: 25.sp,
            color: Mycolors.myBlue,
            fontWeight: FontWeight.bold),
      ),
    ),
    // backgroundColor: Mycolors.myWhite,
  );
}

Widget _buildBody(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    children: [
      Divider(
        thickness: 0.8.sp,
        color: Colors.black,
      ),
      SizedBox(
        height: 50.h,
      ),
      passTextFields(),
      confirmPassword(
        context: context,
      ),
    ],
  );
}
