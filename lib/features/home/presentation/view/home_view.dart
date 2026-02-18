import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/features/home/presentation/view/widget/home/home_body.dart';
import 'package:onlyproject/features/home/presentation/view_model/cubit/count_notes_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeNotesCubit()..getAllCounts(),
      child: const HomeBody(),
    );
  }
}
