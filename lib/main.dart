import 'package:flutter/material.dart';
import 'notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Local Notifications")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => NotificationService(context)..showNotification(),
              child: Text("Bir martalik Notification Yuborish"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  NotificationService(context)..scheduleNotification(),
              child: Text("Rejalashtirilgan Notification yuborish"),
            ),
          ],
        ),
      ),
    );
  }
}
