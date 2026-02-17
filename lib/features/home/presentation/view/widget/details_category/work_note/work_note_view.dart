import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/work_note/work_note_body.dart';
import 'package:onlyproject/features/home/presentation/view_model/work/work_note_cubit.dart';

class WorkNoteView extends StatelessWidget {
  const WorkNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkNoteCubit()..getnotes(),
      child: const WorkNoteBody(),
    );
  }
}
