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
      if (querySnapshot.exists && querySnapshot.data() != null) {
        emit(InfoUserSuccess(user: UserModel.fromJson(querySnapshot.data()!)));
      } else {
        final firebaseUser = FirebaseAuth.instance.currentUser!;
        emit(
          InfoUserSuccess(
            user: UserModel(
              uid: firebaseUser.uid,
              name: firebaseUser.displayName ?? "No Name",
              email: firebaseUser.email ?? "No Email",
              phone: 'No Phone',
              address: 'No Address',
              createdAt: DateTime.now(),
            ),
          ),
        );
      }
    } catch (e) {
      emit(InfoUserFailure(message: e.toString()));
    }
  }
}
