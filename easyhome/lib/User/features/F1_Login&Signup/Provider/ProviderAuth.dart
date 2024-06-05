import 'package:flutter/material.dart';

class ProviderValidate with ChangeNotifier {
  bool validated = true;

  void setValidated(bool value) {
    validated = value;
    notifyListeners();
  }
}

class ProviderObscure with ChangeNotifier {
  bool isObscured = true;

  void setObscure(bool value) {
    isObscured = value;
    notifyListeners();
  }
}

class ProviderEqual with ChangeNotifier {
  bool equal = false;

  void setPassword(bool value) {
    equal = value;
    notifyListeners();
  }
}

class ProviderValue with ChangeNotifier {
  String val = "null";

  void setVal(String value) {
    val = value;
    notifyListeners();
  }
}

class ProviderLoading with ChangeNotifier {
  bool isLoading = false;

  void setLoad(bool value) {
    isLoading = value;
    notifyListeners();
  }
}

class ProviderLoading1 with ChangeNotifier {
  bool isLoading = false;

  void setLoad(bool value) {
    isLoading = value;
    notifyListeners();
  }
}

class ProviderLoading2 with ChangeNotifier {
  bool isLoading = false;

  void setLoad(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
