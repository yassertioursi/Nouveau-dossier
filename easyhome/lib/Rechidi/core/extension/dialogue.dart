import 'package:flutter/material.dart';

extension Dialogue on BuildContext {
  void showDialogue({
    String? title,
    required Widget child,
  }) {
    showDialog(
      context: this,
      builder: (context) {
        return AlertDialog(
          title: title != null ? Text(title) : null,
          content: child,
        );
      },
    );
  }
}
