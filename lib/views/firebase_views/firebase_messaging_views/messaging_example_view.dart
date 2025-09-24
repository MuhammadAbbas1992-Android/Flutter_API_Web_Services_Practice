import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessagingExampleView extends StatefulWidget {
  const MessagingExampleView({super.key});

  @override
  State<MessagingExampleView> createState() => _MessagingExampleViewState();
}

class _MessagingExampleViewState extends State<MessagingExampleView> {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  String _notificationText = "ABC No messages yet";

  @override
  void initState() {
    super.initState();
    _requestPermission();
    _initFCM();
  }

  void _requestPermission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print("ABC User granted permission: ${settings.authorizationStatus}");
  }

  void _initFCM() async {
    // Get the token
    String? token = await _messaging.getToken();
    print("ABC FCM Token: $token");

    // Foreground message
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("ABC Got a message in foreground: ${message.notification?.title}");
      setState(() {
        _notificationText =
            "App already opened\n${message.notification?.title ?? ''} - ${message.notification?.body ?? ''}";
      });
    });

    // When app is opened by tapping a notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("ABC Message clicked!");
      setState(() {
        _notificationText =
            "ABC Opened from notification: ${message.notification?.title}";
      });
    });
    // When app is opened from terminated state
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      print(
          "ABC App opened from terminated state: ${initialMessage.notification?.title}");
      setState(() {
        _notificationText =
            "ABC Opened from terminated: ${initialMessage.notification?.title}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Messaging Example")),
      body: Center(
        child: Text(
          _notificationText,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
