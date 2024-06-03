// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SortByProvider extends ChangeNotifier {
  String selectedSort = "Default";

  void setSelectedSort(String sort) {
    selectedSort = sort;
    notifyListeners();
  }
}
