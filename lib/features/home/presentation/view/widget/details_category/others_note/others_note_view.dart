import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/others_note/others_note_body.dart';
import 'package:onlyproject/features/home/presentation/view_model/others/others_note_cubit.dart';

class OthersNoteView extends StatelessWidget {
  const OthersNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OthersNoteCubit()..getnotes(),
      child: const OthersNoteBody(),
    );
  }
}
