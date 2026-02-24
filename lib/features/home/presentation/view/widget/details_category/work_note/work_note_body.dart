import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/core/widgets/custom_list_of_note.dart';
import 'package:onlyproject/core/widgets/custom_loading.dart';
import 'package:onlyproject/core/widgets/custom_show_bottom_sheet.dart';
import 'package:onlyproject/features/home/presentation/view_model/work/work_note_cubit.dart';

class WorkNoteBody extends StatelessWidget {
  const WorkNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WorkNoteCubit>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => CustomShowBottomSheet.show(
          context: context,
          titleController: cubit.title,
          subTitleController: cubit.subTitle,
          ontap: () => cubit.addNote(),
        ),
        child: Icon(Icons.edit),
      ),
      appBar: AppBar(title: Text("Work Note"), centerTitle: true),
      body: _buildWorkNotes(),
    );
  }
}

Widget _buildWorkNotes() {
  return BlocBuilder<WorkNoteCubit, WorkNoteState>(
    builder: (context, state) {
      if (state is WorkNoteSuccess) {
        return Padding(
          padding: EdgeInsets.all(12.r),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              final oneNote = state.data[index];
              final cubit = context.read<WorkNoteCubit>();
              return CustomListOfNote(
                id: oneNote["noteId"],
                title: oneNote['title'],
                subtitle: oneNote["subtitle"],
                date: oneNote["createdAt"].toDate(),
                deleteNote: () => context.read<WorkNoteCubit>().deletenote(
                  oneNote.id,
                  oneNote["noteId"],
                ),
                editaNote: () {
                  cubit.editTitle.text = oneNote['title'];
                  cubit.editSubTitle.text = oneNote['subtitle'];
                  CustomShowBottomSheet.show(
                    titleController: cubit.editTitle,
                    subTitleController: cubit.editSubTitle,
                    context: context,
                    isEdit: true,
                    ontap: () => cubit.updatenote(oneNote.id),
                  );
                },
              );
            },
          ),
        );
      }
      return CustomLoading();
    },
  );
}
