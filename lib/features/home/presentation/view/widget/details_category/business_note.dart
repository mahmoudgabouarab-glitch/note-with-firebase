import 'package:flutter/material.dart';
import 'package:onlyproject/core/widgets/custom_list_of_note.dart';
import 'package:onlyproject/core/widgets/custom_show_bottom_sheet.dart';

class BusinessNote extends StatelessWidget {
  const BusinessNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => CustomShowBottomSheet.show(context: context),
        child: Icon(Icons.edit),
      ),
      appBar: AppBar(title: Text("Business Note"), centerTitle: true),
      // body: CustomListOfNote(
      //   title: 'Note subject',
      //   description: 'sddssdkldsklsdklsdkslksklsdk',
      // ),
    );
  }
}