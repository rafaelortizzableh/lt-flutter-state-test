import 'dart:async';

import 'package:flutter/material.dart';

import '../state/counter_inherited_model.dart';

class CounterStateWrapper extends StatelessWidget {
  const CounterStateWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CounterInheritedModel(
      child: _CounterDisposeWrapper(
        child: child,
      ),
    );
  }
}

class _CounterDisposeWrapper extends StatefulWidget {
  const _CounterDisposeWrapper({
    // ignore: unused_element
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<_CounterDisposeWrapper> createState() => _CounterDisposeWrapperState();
}

class _CounterDisposeWrapperState extends State<_CounterDisposeWrapper> {
  @override
  void dispose() {
    _disposeInheritedModel();
    super.dispose();
  }

  void _disposeInheritedModel() {
    unawaited(
      Future(() => CounterInheritedModel.counterStateOf(context).dispose()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
