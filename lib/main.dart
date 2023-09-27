import 'package:flutter/material.dart';

import 'widgets/button_first_level.dart';
import 'widgets/counter_first_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final _backgroundColor = Colors.teal[100];
  static const _title = 'States';

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: _backgroundColor,
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ButtonFirstLevel(
              onCountIncreased: _onCountIncreased,
              count: _count,
            ),
            CounterFirstWidget(
              count: _count,
            ),
          ],
        ),
      ),
    );
  }

  void _onCountIncreased(int count) {
    final newCount = count + 1;
    setState(() => _count = newCount);
  }
}
