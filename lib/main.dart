import 'package:flutter/material.dart';

import 'widgets/button_first_level.dart';
import 'widgets/counter_first_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          title: const Text('States'),
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
