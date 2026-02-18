import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onlyproject/core/utils/app_color.dart';
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
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle),
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
            if (result == OkCancelResult.ok) {
              deleteNote();
            } else if (result == OkCancelResult.cancel) {
              editaNote();
            }
          },
          color: AppColor.primary,
          icon: const Icon(Icons.settings_suggest_outlined),
        ),
      ),
    );
  }
}

Future<OkCancelResult> _showOkCancelAlertDialog(BuildContext context) =>
    showOkCancelAlertDialog(
      context: context,
      title: "What do you want to do?",
      okLabel: "Delete",
      cancelLabel: "Edit",
      isDestructiveAction: true,
    );
