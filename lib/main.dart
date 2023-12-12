import 'package:alemeno_app/app/views/home/view.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelKey: 'alemeno',
          channelName: 'Health Cart',
          channelDescription: 'Notfications for health cart')
    ],
    debug: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Cart',
      home: HomePage(),
      routes: {
        'home': (p0) => HomePage(),
      },
    );
  }
}
