import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/edit_profile/changePassword/confirm_paswword.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/edit_profile/changePassword/password_text_fields.dart';
import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:easyhome/utils/constants/colors.dart';
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
    backgroundColor: MyColors.mainblue,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 28.sp,
        ),
      ),
    ),
    title: Padding(
      padding: const EdgeInsets.only(top: 23),
      child: Center(
        child: Text(
          "Change Password",
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(30.0), // Set the height here
      child: SizedBox
          .shrink(), // Use SizedBox.shrink() to avoid rendering anything in the PreferredSize
    ),
  );
}

Widget _buildBody(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    children: [
      Divider(
        thickness: 0.0.sp,
        color: Colors.transparent,
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
