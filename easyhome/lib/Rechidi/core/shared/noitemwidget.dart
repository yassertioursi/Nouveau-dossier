import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class NoItemsWidget extends StatelessWidget {
  const NoItemsWidget({
    super.key,
    required bool condition,
    String message = 'No items found',
    required Widget child,
  })  : _condition = condition,
        _message = message,
        _child = child;

  final bool _condition;
  final String _message;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: _condition,
      builder: (context) => _child,
      fallback: (context) => Center(
        child: Text(
          _message,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
