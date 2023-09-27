import 'package:flutter/material.dart';

import 'button_widget.dart';

class ButtonFirstLevel extends StatelessWidget {
  const ButtonFirstLevel({
    super.key,
    required this.onCountIncreased,
    required this.count,
  });

  final void Function(int currentCount) onCountIncreased;
  final int count;

  static final _backgroundColor = Colors.blueGrey[400] ?? Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: _backgroundColor,
      child: ButtonWidget(
        count: count,
        onCountIncreased: onCountIncreased,
      ),
    );
  }
}
