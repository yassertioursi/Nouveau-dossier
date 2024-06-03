import 'package:flutter/material.dart';

extension SnackbarExtension on BuildContext {
  void showSnackBar(
    String message,
  ) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void showSnackBarError(
    String message,
  ) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }
}
