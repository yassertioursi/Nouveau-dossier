// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class WilayaProvider extends ChangeNotifier {
  String selectedWilaya = "All";

  void setSelectedWilaya(String wilaya) {
    selectedWilaya = wilaya;
    notifyListeners();
  }
}
