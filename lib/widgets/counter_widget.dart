import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  static final _backgroundColor = Colors.blue[800] ?? Colors.blue;
  static const _foregroundColor = Colors.white;
  static const _fontSize = 18.0;
  static const _externalPadding = EdgeInsets.all(30.0);
  static const _internalPadding = EdgeInsets.all(10.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _externalPadding,
      child: ColoredBox(
        color: _backgroundColor,
        child: const Center(
          child: Padding(
            padding: _internalPadding,
            child: Text(
              '28',
              style: TextStyle(
                fontSize: _fontSize,
                color: _foregroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
