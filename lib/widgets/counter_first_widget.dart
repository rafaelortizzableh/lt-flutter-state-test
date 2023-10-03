import 'package:flutter/material.dart';

import 'counter_widget.dart';

class CounterFirstWidget extends StatelessWidget {
  const CounterFirstWidget({
    super.key,
    required this.count,
  });

  final int count;

  static final _backgroundColor =
      Colors.orangeAccent[200] ?? Colors.orangeAccent;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: _backgroundColor,
      child: CounterWidget(
        count: count,
      ),
    );
  }
}
