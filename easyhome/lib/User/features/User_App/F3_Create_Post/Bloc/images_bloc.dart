import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';

class Bloc_Image extends ChangeNotifier {
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
