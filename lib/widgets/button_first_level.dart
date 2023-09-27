import 'package:flutter/material.dart';

import 'button_widget.dart';

class ButtonFirstLevel extends StatelessWidget {
  const ButtonFirstLevel({super.key});

  static final _backgroundColor = Colors.blueGrey[400] ?? Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: _backgroundColor,
      child: const ButtonWidget(),
    );
  }
}
