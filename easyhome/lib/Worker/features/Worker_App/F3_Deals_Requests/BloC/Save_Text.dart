import 'package:flutter/material.dart';

class Save_Text with ChangeNotifier {
  bool changed = false;
  void setChanged(bool value) {
    changed = value;
    notifyListeners();
  }
}

class Save_Text_One with ChangeNotifier {
  bool changed = false;
  void setChanged(bool value) {
    changed = value;
    notifyListeners();
  }
}
