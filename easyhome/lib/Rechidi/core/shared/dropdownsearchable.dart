import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';

class AppDropDown extends StatefulWidget {
  const AppDropDown(
      {super.key,
      required this.items,
      required this.textEditingController,
      this.hintText = 'Select Item'});

  final List<String> items;
  final TextEditingController textEditingController;
  final String hintText;

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: widget.items
          .map(
            (item) => DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ),
          )
          .toList(),
      onChanged: (value) =>
          widget.textEditingController.text = value.toString(),
      decoration: InputDecoration(
        hintText: '   ${widget.hintText}',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(
            color: AppColors.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
      ),
      borderRadius: BorderRadius.circular(20.r),
    );
  }
}
