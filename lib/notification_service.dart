import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_notificationss/value_screen.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final BuildContext context;
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService(this.context) {
    _initializeNotifications();
  }

  void _initializeNotifications() async {
    tz.initializeTimeZones();

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();

    const InitializationSettings settings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);

    await _notificationsPlugin.initialize(settings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
      log("Notification bosildi: ${response.payload}");
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ValueScreen(
            value: response.payload.toString(),
          ),
        ),
      );
    });
  }

  Future<void> showNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails('channel_id', 'General Notifications',
            importance: Importance.high, priority: Priority.high);

    const NotificationDetails details =
        NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(
      0,
      "Bir martalik notification",
      "Bu Flutter Local Notification misoli",
      details,
      payload: "Bir martalik notification bosildi",
    );
  }

  Future<void> scheduleNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails('channel_id', 'Scheduled Notifications',
            importance: Importance.high, priority: Priority.high);

    const NotificationDetails details =
        NotificationDetails(android: androidDetails);

    await _notificationsPlugin.zonedSchedule(
      1,
      "Rejalashtirilgan Notification",
      "Bu bildirishnoma 5 soniyadan keyin chiqadi",
      tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)),
      details,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exact,
      payload: "Rejalashtirilgan notification bosildi!",
    );
  }
}
