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
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
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
  static Future<void> showRepeatNotification({
    required RepeatInterval repeatInterval,
    required String title,
    required String body,
    required int id,
  }) async {
    await flutterLocalNotificationsPlugin.periodicallyShow(
      repeatInterval: repeatInterval,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      id: id,
      title: title,
      body: body,
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
      scheduledDate: tz.TZDateTime.now(
        tz.local,
      ).add(const Duration(seconds: 5)),
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
  static Future<void> cancelNotification({required int id}) async {
    await flutterLocalNotificationsPlugin.cancel(id: id);
  }
}
