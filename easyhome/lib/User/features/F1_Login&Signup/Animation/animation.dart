import 'package:flutter/material.dart';

class SlideRight extends PageRouteBuilder {
  final Widget Page;
  final Offset begin;
  final Offset end;

  SlideRight({
    required this.Page,
    required this.begin,
    required this.end,
  }) : super(
          pageBuilder: (context, animation, animationtwo) => Page,
          transitionsBuilder: (context, animation, animationtwo, child) {
            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween);

            var slideTransition = SlideTransition(
              position: offsetAnimation,
              child: child,
            );

            return slideTransition;
          },
          transitionDuration: Duration(milliseconds: 400),
        );
}
