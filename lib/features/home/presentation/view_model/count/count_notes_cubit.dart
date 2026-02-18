import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/network/fire_base_helper.dart';
import 'package:onlyproject/features/home/data/model/title_card.dart';

part 'count_notes_state.dart';

class HomeNotesCubit extends Cubit<HomeNotesState> {
  HomeNotesCubit() : super(HomeNotesInitial());

  Future<void> getAllCounts() async {
    emit(HomeNotesLoading());

    try {
      List<int> counts = [];

      for (var card in titleCard) {
        var querySnapshot = await FBHelper.getNote(
          fBD: card.docPath,
          fBC: card.cPath,
        );
        counts.add(querySnapshot.length);
      }

      emit(HomeNotesSuccess(count: counts));
    } catch (e) {
      emit(HomeNotesFailure(message: e.toString()));
    }
  }
}
