import 'package:easyhome/Rechidi/core/shared/spacing.dart';
import 'package:flutter/material.dart';

extension SnackbarExtension on BuildContext {
  void showSnackBar(String message) {
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
        content: Row(
          children: [
            const Icon(Icons.error, color: Colors.white),
            width(8),
            Expanded(
              child: Text(
                message,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
