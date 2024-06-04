// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RatingProvider extends ChangeNotifier {
  double rating = 0;

  setrating(r) {
    rating = r;
    notifyListeners();
  }
}
