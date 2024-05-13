import 'package:flutter/material.dart';

class Select_Job with ChangeNotifier {
  List<String> selectedItems = [];

  void set_Selected(String item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
    notifyListeners();
  }
}
