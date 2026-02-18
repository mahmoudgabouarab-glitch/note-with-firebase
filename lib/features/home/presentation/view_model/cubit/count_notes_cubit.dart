import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/network/constant_collection_fb.dart';
import 'package:onlyproject/features/home/data/model/title_card.dart';

part 'count_notes_state.dart';

class CountNotesCubit extends Cubit<CountNotesState> {
  CountNotesCubit() : super(CountNotesInitial());

  Future<void> getAllCounts() async {
    emit(CountNotesLoading());

    try {
      List<int> counts = [];

      for (var card in titleCard) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection(FB.notes)
            .doc(card.docPath)
            .collection(card.cPath)
            .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get();

        counts.add(querySnapshot.docs.length);
      }

      emit(CountNotesSuccess(count: counts));
    } catch (e) {
      emit(CountNotesFailure(message: e.toString()));
    }
  }
}
