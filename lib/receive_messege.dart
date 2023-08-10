import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void getMessege(BuildContext context) async {
  FlutterLocalNotificationsPlugin flutterLocalNotifications =
        FlutterLocalNotificationsPlugin();

    String message = '';
    int messageId = 0;
    int empId = 0;
    bool isOpen = true;
    String token = '';
    bool isOnlyUnRead = false;

    late WebSocketChannel channel = IOWebSocketChannel.connect(
      'wss://wsdev.yellow-time.de/app-notifications?Authorization=Bearer%20eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI4MzIiLCJhdXRoIjp7ImF1dGhvcml0eSI6IkFQUF9ERUZBVUxUX1JPTEUifSwiZW1wSWQiOiI4MzIiLCJ1c2VyTmFtZSI6InRlc3RpbmcxQGdtYWlsLmNvbSIsImRldmljZUlkIjoiMTIzNDU2NyIsInRlbmFudElkIjoxLCJpYXQiOjE2OTE2NTA4NjksImV4cCI6MTY5MTczNzI2OX0.W0TaSLTGp4nxefgICR-KBZoZj-XCG7QbXGb0z4As2Po', //yellow time app token
    );

    print("before web socket connection");

    Future<void> _showNotification(String message) async {
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        channelDescription: 'channel_description',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: true,
      );
      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);

      await flutterLocalNotifications.show(
        0,
        'notification',
        message,
        platformChannelSpecifics,
        payload: 'item x',
      );
    }

    print('channel connected , login token $token');

    try {
      channel.stream.listen(
        (event) {
          print("Recieved websocket message ; $event");
          Map receivedMsg = jsonDecode(event);
          if (receivedMsg.containsKey('type')) {
            String type = receivedMsg['type'];
            print("type : " + type);
          } else {
            message = receivedMsg["message"];
            messageId = receivedMsg["messageId"];
            empId = receivedMsg["empId"];
            isOnlyUnRead = receivedMsg["isOnlyUnread"];

            _showNotification(message);

            if (message.isNotEmpty &&
                messageId != 0 &&
                empId != 0 &&
                isOpen == true) {
              isOpen = false;
              print('inside show dialog condition');
              // showDetailDialog(
              //   context: context,
              //   titleText: 'notification'.tr,
              //   bodyText: message,
              //   onTap: () {
              //     isOpen = true;
              //     if (isOnlyUnRead) {
              //       apiService.MessageReadAPI(messageId: messageId.toString());
              //       Navigator.pop(context);
              //       print('is only unread $isOnlyUnRead');
              //     } else {
              //       apiService.MessageReadAPI(messageId: messageId.toString());
              //       Navigator.of(context).push(
              //         MaterialPageRoute(
              //             builder: (BuildContext context) =>
              //                 MessageListScreen()),
              //       );
              //       print('is only unread $isOnlyUnRead');
              //     }
              //   },
              // );
            }
          }
        },
        onError: (error) {
          // FlutterLogs.logThis(
          //   tag: 'Web socket',
          //   subTag: 'after web socket trigger',
          //   logMessage: 'after web socket triggered Exception',
          //   level: LogLevel.ERROR,
          // );
          // channel1.sink.close();
        },
        onDone: () {
          print("WebSocket connection closed");
          // FlutterLogs.logThis(
          //   tag: 'Web socket',
          //   subTag: 'web socket connection status',
          //   logMessage: 'WebSocket connection closed',
          //   level: LogLevel.INFO,
          // );
        },
      );
    } catch (e) {
      print("Web socket Exception $e");
    }
    print('Web socket done');
}