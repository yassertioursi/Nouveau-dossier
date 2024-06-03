import 'package:flutter/material.dart';

class ProviderOk with ChangeNotifier {
  bool isOk = false;
  void setOk(bool value) {
    isOk = value;
    notifyListeners();
  }

  void setVisible(bool bool) {}
}

class ProviderOk2 with ChangeNotifier {
  bool isOk = false;
  void setOk(bool value) {
    isOk = value;
    notifyListeners();
  }

  void setVisible(bool bool) {}
}
