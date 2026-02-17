import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/core/utils/extension.dart';
import 'package:onlyproject/core/widgets/custom_list_of_note.dart';
import 'package:onlyproject/core/widgets/custom_loading.dart';
import 'package:onlyproject/core/widgets/custom_show_bottom_sheet.dart';
import 'package:onlyproject/features/home/presentation/view_model/others/others_note_cubit.dart';

class OthersNoteBody extends StatelessWidget {
  const OthersNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OthersNoteCubit>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => CustomShowBottomSheet.show(
          context: context,
          titleController: cubit.title,
          subTitleController: cubit.subTitle,
          ontap: () {
            cubit.addNote();
            context.popPage();
          },
        ),
        child: Icon(Icons.edit),
      ),
      appBar: AppBar(title: Text("Others Note"), centerTitle: true),
      body: _buildOthersNotes(),
    );
  }
}

Widget _buildOthersNotes() {
  return BlocBuilder<OthersNoteCubit, OthersNoteState>(
    builder: (context, state) {
      if (state is OthersNoteSuccess) {
        return Padding(
          padding: EdgeInsets.all(12.r),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              final cubit = state.data[index];
              return CustomListOfNote(
                title: cubit['title'],
                subtitle: cubit["subtitle"],
                date: cubit["createdAt"].toDate(),
                ontap: () =>
                    context.read<OthersNoteCubit>().deletenote(cubit.id),
              );
            },
          ),
        );
      }
      return CustomLoading();
    },
  );
}
