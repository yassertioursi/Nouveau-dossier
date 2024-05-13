import 'package:flutter/material.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/text_log_sign_field.dart';
import 'package:provider/provider.dart';

class bloc_one with ChangeNotifier {
  bool validated = true;

  void setValidated(bool value) {
    validated = value;
    notifyListeners();
  }
}

class bloc_two with ChangeNotifier {
  bool isObscured = true;

  void setObscure(bool value) {
    isObscured = value;
    notifyListeners();
  }
}

class bloc_three with ChangeNotifier {
  bool equal = false;

  void setPassword(bool value) {
    equal = value;
    notifyListeners();
  }
}

class bloc_four with ChangeNotifier {
  String val = "null";

  void setVal(String value) {
    val = value;
    notifyListeners();
  }
}

class bloc_five with ChangeNotifier {
  bool isLoading = false;

  void setLoad(bool value) {
    isLoading = value;
    notifyListeners();
  }
}

class bloc_five_One with ChangeNotifier {
  bool isLoading = false;

  void setLoad(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
