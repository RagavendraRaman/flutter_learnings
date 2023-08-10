import 'package:flutter/material.dart';
import 'dart:math';

final random = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var diceImageNumber = 1;

  void rollDice() {
    setState(() {
      diceImageNumber = random.nextInt(5) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice_$diceImageNumber.png',
          width: 200,
          height: 200,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(top: 10),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 30),
          ),
          child: const Text(
            'Roll Dice',
          ),
        )
      ],
    );
  }
}
