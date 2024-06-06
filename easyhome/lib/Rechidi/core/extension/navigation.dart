import 'package:easyhome/User/features/F1_Login&Signup/Animation/animation.dart';
import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<D?> to<D>(Widget page) {
    return Navigator.of(this).push<D>(SlideRight(
      Page: page,
      begin: const Offset(1, 0),
      end: Offset.zero,
    ));
  }

  void toNamed(String routeName) {
    Navigator.of(this).pushNamed(routeName);
  }

  void off(Widget page) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  void offNamed(String routeName) {
    Navigator.of(this).pushReplacementNamed(routeName);
  }

  void navigateToAndRemoveUntil(Widget page) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  void navigateToNamedAndRemoveUntil(String routeName) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  void back<T>([T? result]) {
    Navigator.of(this).pop(result);
  }
}
