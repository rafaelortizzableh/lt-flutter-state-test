import 'package:flutter/material.dart';
import 'package:flutter_state_test/state/counter_inherited_model.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  static final _backgroundColor = Colors.blue[800];
  static const _externalPadding = EdgeInsets.all(30.0);
  static const _internalPadding = EdgeInsets.all(10.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _externalPadding,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _backgroundColor,
        ),
        onPressed: CounterInheritedModel.of(context).increment,
        child: const Padding(
          padding: _internalPadding,
          child: Icon(Icons.plus_one),
        ),
      ),
    );
  }
}
