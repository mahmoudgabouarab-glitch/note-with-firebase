import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void onTap(NotificationResponse notificationResponse) {}
  // initialize
  static Future<void> initialize() async {
    final InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/launcher_icon'),
    );
    await flutterLocalNotificationsPlugin.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  // base notification
  static Future<void> showBaseNotification() async {
    await flutterLocalNotificationsPlugin.show(
      id: 0,
      title: 'title',
      body: 'Base',
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'channel id',
          'channel name',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        ),
      ),
    );
  }

  // repeat notification
  static Future<void> showRepeatNotification() async {
    await flutterLocalNotificationsPlugin.periodicallyShow(
      repeatInterval: RepeatInterval.everyMinute,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      id: 1,
      title: 'title',
      body: 'Repeat',
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'channel id',
          'channel name',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        ),
      ),
    );
  }

  // schedule notification
  static Future<void> showScheduleNotification() async {
    tz.initializeTimeZones();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id: 2,
      title: 'title',
      body: 'Schedule',
      scheduledDate: tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, 
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'channel id',
          'channel name',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        ),
      ),
    );
  }

  // cancel notification
  static Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(id: 1);
  }
}
