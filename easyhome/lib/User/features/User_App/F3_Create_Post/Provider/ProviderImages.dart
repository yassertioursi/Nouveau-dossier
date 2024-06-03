import 'dart:io';

import 'package:flutter/material.dart';

class ProviderImages extends ChangeNotifier {
  List<File> Images = [];

  void Add_Image(List<File> tmpImages) {
    Images = Images + tmpImages;
    notifyListeners();
  }

  void Del_Image(int index) {
    Images.removeAt(index);
    notifyListeners();
  }

  void just_notify() {
    notifyListeners();
  }
}

class ProviderImagesNetwork extends ChangeNotifier {
  List Images = [];

  void Add_Image(List tmpImages) {
    Images = Images + tmpImages;
    notifyListeners();
  }

  void Del_Image(int index) {
    Images.removeAt(index);
    notifyListeners();
  }

  void just_notify() {
    notifyListeners();
  }
}
