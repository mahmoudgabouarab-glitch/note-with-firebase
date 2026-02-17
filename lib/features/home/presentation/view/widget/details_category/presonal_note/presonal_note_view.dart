import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/presonal_note/presonal_note_body.dart';
import 'package:onlyproject/features/home/presentation/view_model/presonal/presonal_note_cubit.dart';

class PresonalNoteView extends StatelessWidget {
  const PresonalNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PresonalNoteCubit()..getnotes(),
      child: PresonalNoteBody(),
    );
  }
}
