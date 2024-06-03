import 'package:flutter/material.dart';

class ChangeStatus with ChangeNotifier {
  String status = "";
  void setStatus(String val) {
    status = val;
    notifyListeners();
  }
}
