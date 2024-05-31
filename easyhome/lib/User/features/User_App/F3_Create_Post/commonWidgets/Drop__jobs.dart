// ignore_for_file: prefer_const_constructors

import 'package:easyhome/utils/constants/Categorys.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/drop_jobs_provider.dart';

class DropJobs extends StatelessWidget {
  String inital;
  DropJobs({super.key, required this.inital});

  @override
  Widget build(BuildContext context) {
    bool yesorno = true;
    return Consumer<DropJobsProvider>(
      builder: (context, provider, child) {
        if (yesorno) {
          provider.updateDropdownValue(inital);
          yesorno = false;
        }
        return Container(
          padding: const EdgeInsets.only(right: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1.5),
          ),
          child: Flexible(
            child: DropdownButton<String>(
              hint: Text(
                inital,
                style: TextStyle(
                  color: MyColors.mainblue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              borderRadius: BorderRadius.circular(10),
              underline: Container(),
              focusColor: Colors.white,
              value: provider.dropdownValue,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: MyColors.mainblue,
                size: 25,
              ),
              onChanged: (newValue) {
                provider.updateDropdownValue(newValue);
              },
              items: provider.categories
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "  $value",
                      style: const TextStyle(
                        color: MyColors.mainblue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
