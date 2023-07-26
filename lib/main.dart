import 'package:flutter/material.dart';

import 'package:dice_application/gradient_container.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
        body: GradientContainer(
            [Color.fromARGB(255, 31, 2, 68), Color.fromARGB(255, 46, 2, 75)])),
  ));
}
