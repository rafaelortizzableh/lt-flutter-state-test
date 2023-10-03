import 'package:flutter/material.dart';

class CounterInheritedModel extends InheritedModel<CounterState> {
  CounterInheritedModel({
    super.key,
    required super.child,
  });

  final _counterState = CounterState();

  static CounterInheritedModel of(BuildContext context) {
    final inheritedModel =
        context.dependOnInheritedWidgetOfExactType<CounterInheritedModel>();

    if (inheritedModel == null) {
      throw Exception('No CountInheritedModel found in context');
    }

    return inheritedModel;
  }

  static CounterState counterStateOf(BuildContext context) {
    final counterState = context
        .dependOnInheritedWidgetOfExactType<CounterInheritedModel>()
        ?._counterState;

    if (counterState == null) {
      throw Exception('No CountInheritedModel found in context');
    }

    return counterState;
  }

  void increment() {
    _counterState.increment();
  }

  @override
  bool updateShouldNotify(covariant CounterInheritedModel oldWidget) {
    return _counterState.value != oldWidget._counterState.value;
  }

  @override
  bool updateShouldNotifyDependent(
    covariant CounterInheritedModel oldWidget,
    Set dependencies,
  ) {
    return dependencies.contains(CountAspect.count) &&
        _counterState.value != oldWidget._counterState.value;
  }

  void dispose() {
    _counterState.dispose();
  }
}

class CounterState extends ValueNotifier<int> {
  CounterState() : super(_defaultInitialValue);

  static const _defaultInitialValue = 28;

  void increment() => value++;
}

enum CountAspect { count }
