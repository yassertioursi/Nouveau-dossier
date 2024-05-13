import 'package:flutter/material.dart';

class RefreshApps with ChangeNotifier {
  List? apps;
  void removeApp(int index) {
    apps!.removeAt(index);
    notifyListeners();
  }
}
