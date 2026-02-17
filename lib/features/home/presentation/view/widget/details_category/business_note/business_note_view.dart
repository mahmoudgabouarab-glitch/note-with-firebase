import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/features/home/presentation/view/widget/details_category/business_note/business_note_body.dart';
import 'package:onlyproject/features/home/presentation/view_model/business/business_note_cubit.dart';

class BusinessNoteView extends StatelessWidget {
  const BusinessNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusinessNoteCubit()..getnotes(),
      child: const BusinessNoteBody(),
    );
  }
}
