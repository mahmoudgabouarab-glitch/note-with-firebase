import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/core/utils/app_color.dart';

class CustomListOfNote extends StatelessWidget {
  final String title;
  final String description;
  const CustomListOfNote({
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(bottom: 10),
            child: ListTile(
              title: Text(title),
              subtitle: Text(description),
              trailing: Icon(
                Icons.delete_sweep_outlined,
                color: AppColor.error,
              ),
            ),
          );
        },
      ),
    );
  }
}
