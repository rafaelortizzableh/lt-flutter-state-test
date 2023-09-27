import 'package:flutter/material.dart';

import 'button_first_level.dart';
import 'counter_first_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ButtonFirstLevel(),
        CounterFirstWidget(),
      ],
    );
  }
}
