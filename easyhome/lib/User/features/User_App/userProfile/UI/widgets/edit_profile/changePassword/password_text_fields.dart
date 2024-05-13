import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/edit_profile/changePassword/confirm_paswword.dart';
import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget passTextFields() {
  return const Column(
    children: [
      textField(
        label: "Current Password",
        inputText: "your password",
      ),
      textField(
        label: "Password",
        inputText: "new password",
      ),
      textField(label: "Password Confirm", inputText: "confirm new password"),
    ],
  );
}

// ignore: camel_case_types
class textField extends StatefulWidget {
  const textField(
      {super.key,
      required this.label,
      required this.inputText,
      this.maxlength});

  final String label;
  final String inputText;
  final int? maxlength;
  @override
  State<textField> createState() => _textfieldState();
}

class _textfieldState extends State<textField> {
  final _textController = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 7.h),
      child: SizedBox(
        height: 70.h,
        child: TextField(
          controller: _textController,
          obscureText: _obscureText,
          onChanged: (value) {
            if (value != "") {
              passwordMap[
                      capitalizeFirstLetter(widget.label.replaceAll(' ', ''))] =
                  value;
            } else {
              passwordMap.remove(widget.label);
            }
          },
          decoration: InputDecoration(
              enabled: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: widget.label,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: Mycolors.myBlue,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2.sp,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2.sp,
                  color: Mycolors.myOrange,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              hintText: widget.inputText,
              hintStyle: TextStyle(fontSize: 16.sp)),
        ),
      ),
    );
  }
}

String capitalizeFirstLetter(String input) =>
    input.isEmpty ? input : "${input[0].toLowerCase()}${input.substring(1)}";
