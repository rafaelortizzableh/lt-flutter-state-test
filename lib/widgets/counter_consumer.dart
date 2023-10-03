import 'package:flutter/material.dart';

import '../state/counter_inherited_model.dart';

class CounterConsumer extends StatelessWidget {
  const CounterConsumer({
    super.key,
    required this.builder,
  });

  final Widget Function(
    BuildContext context,
    int count,
    Widget? child,
  ) builder;

  @override
  Widget build(BuildContext context) {
    final counterState = CounterInheritedModel.counterStateOf(context);
    return ValueListenableBuilder<int>(
      valueListenable: counterState,
      builder: builder,
    );
  }
}
