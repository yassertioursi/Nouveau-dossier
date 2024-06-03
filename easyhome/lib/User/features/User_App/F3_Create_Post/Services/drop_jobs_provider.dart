// ignore_for_file: prefer_const_constructors

import 'package:easyhome/utils/constants/Categorys.dart';
import 'package:flutter/material.dart';

class DropJobsProvider with ChangeNotifier {
  String? _dropdownValue;
  final List<String> _categories = Workers_Cat().cats;

  String? get dropdownValue => _dropdownValue;
  List<String> get categories => _categories;

  void updateDropdownValue(String? newValue) {
    _dropdownValue = newValue;
    notifyListeners();
  }
}
