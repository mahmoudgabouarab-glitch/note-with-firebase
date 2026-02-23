import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onlyproject/core/network/local_notification_service.dart';
import 'package:onlyproject/core/utils/app_color.dart';
import 'package:onlyproject/core/utils/app_styles.dart';
import 'package:onlyproject/core/utils/speacing.dart';

class CustomListOfNote extends StatelessWidget {
  final String title;
  final String subtitle;
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
            final result = await _showOkCancelAlertDialog(context);
            if (result == Result.remove) {
              deleteNote();
            } else if (result == Result.edit) {
              editaNote();
            } else if (result == Result.remember) {
              await LocalNotificationService.showBaseNotification();
            } else if (result == Result.repeat) {
              await LocalNotificationService.showRepeatNotification();
            } else if (result == Result.cancel) {
              await LocalNotificationService.cancelNotification();
            }
          },
          color: AppColor.primary,
          icon: const Icon(Icons.settings_suggest_outlined),
        ),
      ),
    );
  }
}

Future<Result?> _showOkCancelAlertDialog(BuildContext context) =>
    showModalActionSheet<Result>(
      style: AdaptiveStyle.iOS,
      context: context,
      actions: [
        SheetAction(label: "Edit", key: Result.edit),
        SheetAction(
          label: "Remove",
          isDestructiveAction: true,
          key: Result.remove,
        ),
        SheetAction(label: "remember", key: Result.remember),
        SheetAction(label: "Repeat", key: Result.repeat),
        SheetAction(label: "Cancel", key: Result.cancel),
      ],
    );

enum Result { edit, remove, remember, repeat, cancel }
