import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/family_note/family_note_body.dart';
import 'package:onlyproject/features/home/presentation/view_model/family/family_note_cubit.dart';

class FamilyNoteView extends StatelessWidget {
  const FamilyNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FamilyNoteCubit()..getnotes(),
      child: const FamilyNoteBody(),
    );
  }
}
