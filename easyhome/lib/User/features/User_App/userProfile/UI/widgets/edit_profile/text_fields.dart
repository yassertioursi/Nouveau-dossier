import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/edit_profile/save_button.dart';
import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget textFields() {
  return const Column(
    children: [
      textfield(label: "Name", inputText: "your name", maxlength: 15),
      textfield(label: "Bio", inputText: "bio", maxlength: 70),
      textfield(label: "Facebook", inputText: "facebook acount"),
      textfield(label: "Phone Number", inputText: "number"),
      textfield(label: "Email", inputText: "new email"),
      textfield(label: "Wilaya", inputText: "wilaya"),
    ],
  );
}

class textfield extends StatefulWidget {
  const textfield(
      {super.key,
      required this.label,
      required this.inputText,
      this.maxlength});

  final String label;
  final String inputText;
  final int? maxlength;
  @override
  State<textfield> createState() => _textfieldState();
}

class _textfieldState extends State<textfield> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final _textController = TextEditingController();
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 7.h),
      child: SizedBox(
        height: 70.h,
        child: TextField(
          controller: _textController,
          onChanged: (value) {
            if (value != "") {
              userMap[capitalizeFirstLetter(widget.label.replaceAll(' ', ''))] =
                  value;
            } else {
              userMap.remove(widget.label);
            }
          },
          maxLength: (widget.maxlength != null) ? widget.maxlength : null,
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
              hintText: widget.inputText,
              hintStyle: TextStyle(fontSize: 16.sp)),
        ),
      ),
    );
  }
}

String capitalizeFirstLetter(String input) =>
    input.isEmpty ? input : "${input[0].toLowerCase()}${input.substring(1)}";
