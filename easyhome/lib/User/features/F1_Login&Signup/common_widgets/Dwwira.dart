import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Dwwira extends StatelessWidget {
  final color;
  final height;
  final width;
  const Dwwira(
      {Key? key,
      required this.color,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CircularProgressIndicator(
        strokeWidth: 8,
        backgroundColor: Color.fromARGB(120, 20, 72, 140),
        strokeCap: StrokeCap.round,
        color: color,
      ),
    );
  }
}
