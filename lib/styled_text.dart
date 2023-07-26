import 'package:flutter/material.dart';

class StyledContainer extends StatelessWidget {
  const StyledContainer(this.text, {super.key});

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28.0,
      ),
    );
  }
}
