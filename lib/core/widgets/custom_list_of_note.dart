import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onlyproject/core/utils/app_color.dart';
import 'package:onlyproject/core/utils/speacing.dart';

class CustomListOfNote extends StatelessWidget {
  final String title;
  final String subtitle;
  final DateTime date;
  final void Function() ontap;
  const CustomListOfNote({
    required this.title,
    required this.subtitle,
    super.key,
    required this.date,
    required this.ontap,
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
          onPressed: ontap,
          color: AppColor.error,
          icon: const Icon(Icons.delete_sweep_outlined),
        ),
      ),
    );
  }
}
