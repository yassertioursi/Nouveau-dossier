import 'package:flutter/material.dart';

class ProviderFilter with ChangeNotifier {
  List<String> jobs = [];
  String minPrice = "";
  String maxPrice = "";

  void setminPrice(String value) {
    minPrice = value;
    notifyListeners();
  }

  void setmaxPrice(String value) {
    maxPrice = value;
    notifyListeners();
  }

  void setjobs(List<String> value) {
    jobs = value;
    notifyListeners();
  }
}
