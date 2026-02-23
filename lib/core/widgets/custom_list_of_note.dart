import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:onlyproject/core/network/local_notification_service.dart';
import 'package:onlyproject/core/utils/app_color.dart';
import 'package:onlyproject/core/utils/app_styles.dart';
import 'package:onlyproject/core/utils/speacing.dart';

class CustomListOfNote extends StatelessWidget {
  final String title;
  final String subtitle;
  final int id;
  final DateTime date;
  final void Function() deleteNote;
  final void Function() editaNote;
  const CustomListOfNote({
    required this.title,
    required this.subtitle,
    super.key,
    required this.date,
    required this.deleteNote,
    required this.editaNote,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(title, style: Styles.s22_600),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle,
              style: Styles.s16_600.copyWith(color: AppColor.textSubTitle),
            ),
            spaceH(5),
            Text(
              DateFormat('d/M/yy - hh:mm a').format(date),
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () async {
            final result = await _showAlertDialog(context);
            if (result == Result.remove) {
              deleteNote();
            } else if (result == Result.edit) {
              editaNote();
            } else if (result == Result.remember) {
              if (!context.mounted) return;
              final result = await _showAlertDialogNotification(context);
              if (result == NotificationResult.everyMinute) {
                LocalNotificationService.showRepeatNotification(
                  repeatInterval: RepeatInterval.everyMinute,
                  title: title,
                  body: subtitle,
                  id: id,
                );
              } else if (result == NotificationResult.hourly) {
                LocalNotificationService.showRepeatNotification(
                  repeatInterval: RepeatInterval.hourly,
                  title: title,
                  body: subtitle,
                  id: id,
                );
              } else if (result == NotificationResult.daily) {
                LocalNotificationService.showRepeatNotification(
                  repeatInterval: RepeatInterval.daily,
                  title: title,
                  body: subtitle,
                  id: id,
                );
              } else if (result == NotificationResult.weekly) {
                LocalNotificationService.showRepeatNotification(
                  repeatInterval: RepeatInterval.weekly,
                  title: title,
                  body: subtitle,
                  id: id,
                );
              } else if (result == NotificationResult.remove) {
                LocalNotificationService.cancelNotification(id: id);
              }
            }
          },
          color: AppColor.primary,
          icon: const Icon(Icons.settings_suggest_outlined),
        ),
      ),
    );
  }
}

Future<Result?> _showAlertDialog(BuildContext context) {
  return showModalActionSheet<Result>(
    style: AdaptiveStyle.iOS,
    context: context,
    actions: [
      SheetAction(label: "Edit", key: Result.edit),
      SheetAction(label: "Remember Me", key: Result.remember),
      SheetAction(
        label: "Delete",
        isDestructiveAction: true,
        key: Result.remove,
      ),
    ],
  );
}

Future<NotificationResult?> _showAlertDialogNotification(BuildContext context) {
  return showModalActionSheet<NotificationResult>(
    style: AdaptiveStyle.iOS,
    context: context,
    actions: [
      SheetAction(label: "Every Minute", key: NotificationResult.everyMinute),
      SheetAction(label: "Every Hour", key: NotificationResult.hourly),
      SheetAction(label: "Every Day", key: NotificationResult.daily),
      SheetAction(label: "Every Week", key: NotificationResult.weekly),
      SheetAction(
        label: "Remove",
        isDestructiveAction: true,
        key: NotificationResult.remove,
      ),
    ],
  );
}

enum Result { edit, remove, remember }

enum NotificationResult { everyMinute, hourly, daily, weekly, remove }
