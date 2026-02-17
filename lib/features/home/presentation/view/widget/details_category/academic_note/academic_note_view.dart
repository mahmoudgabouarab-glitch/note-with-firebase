import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/academic_note/academic_note_body.dart';
import 'package:onlyproject/features/home/presentation/view_model/academic/academic_note_cubit.dart';

class AcademicNoteView extends StatelessWidget {
  const AcademicNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AcademicNoteCubit()..getnotes(),
      child: const AcademicNoteBody(),
    );
  }
}
