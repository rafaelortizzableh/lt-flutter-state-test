import 'package:flutter/material.dart';

import 'counter_consumer.dart';

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
        child: Center(
          child: Padding(
            padding: _internalPadding,
            child: CounterConsumer(
              builder: (context, count, child) {
                return Text(
                  count.toString(),
                  style: const TextStyle(
                    fontSize: _fontSize,
                    color: _foregroundColor,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
