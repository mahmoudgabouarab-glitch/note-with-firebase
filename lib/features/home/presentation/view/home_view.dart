import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/features/auth/view_model/cubit/info_user_cubit.dart';
import 'package:onlyproject/features/home/presentation/view/widget/home/home_body.dart';
import 'package:onlyproject/features/home/presentation/view_model/count/count_notes_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeNotesCubit()..getAllCounts()),
        BlocProvider(create: (context) => InfoUserCubit()..getInfoUser()),
      ],
      child: const HomeBody(),
    );
  }
}
