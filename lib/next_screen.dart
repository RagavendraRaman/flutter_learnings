import 'package:flutter/material.dart';
import 'package:dice_application/receive_messege.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  @override
  void initState() {
    super.initState();
    // getMessege(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next screen'),
      ),
      body: const Center(
        child: Text('Next screen'),
      ),
    );
  }
}
