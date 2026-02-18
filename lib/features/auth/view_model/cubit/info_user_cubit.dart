import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/features/auth/model/user_model.dart';

part 'info_user_state.dart';

class InfoUserCubit extends Cubit<InfoUserState> {
  InfoUserCubit() : super(InfoUserInitial());
  Future<void> getInfoUser() async {
    emit(InfoUserLoading());
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      emit(InfoUserSuccess(user: UserModel.fromJson(querySnapshot.data()!)));
    } catch (e) {
      emit(InfoUserFailure(message: e.toString()));
    }
  }
}
