import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:dice_application/receive_messege.dart';

import 'next_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = '';

  @override
  void initState() {
    super.initState();
    getMessege(context);
    // _initLocalNotifications();
    // _steamListner();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebSocket Notifications 1'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Listening to WebSocket notifications...'),
            ElevatedButton(
              onPressed: (() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyWidget()),
                );
              }),
              child: const Text('Next page'),
            )
          ],
        ),
      ),
    );
  }
}
