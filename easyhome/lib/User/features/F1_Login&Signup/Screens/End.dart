import 'package:flutter/material.dart';

class End extends StatelessWidget {
  const End(this._title, {super.key});

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_title),
      ),
    );
  }
}
