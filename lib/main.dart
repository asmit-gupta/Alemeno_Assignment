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

/*
I have implemented some get snackbar in dummy buttons like when there is not product in the cart,
when date is not selected, etc. only to show information. We could have left it totally non-functional too.

  ✔ Responsive Design
  ✔ Clean Architecture Implementation: I have used MVC Architecture along with GetX/
  ✔ DRY Implemented: made many reusable components(stateless widgets) and used them throughout, reducing 
  complexity of the app.
  ✔ Notifications are also shown after the checkout for the purchase.
  ✔ developed same user interface as shown in the figma file.
*/