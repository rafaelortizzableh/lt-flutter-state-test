import 'package:flutter/material.dart';

import 'widgets/button_first_level.dart';
import 'widgets/counter_first_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _backgroundColor = Colors.teal[100];
  static const _title = 'States';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: _backgroundColor,
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ButtonFirstLevel(),
            CounterFirstWidget(),
          ],
        ),
      ),
    );
  }
}
