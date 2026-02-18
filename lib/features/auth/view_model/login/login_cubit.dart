import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();

  Future<void> loginWithEmailAndPassword() async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(message: e.code.replaceAll(RegExp(r'-'), ' ')));
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      final user = userCredential.user;
      if (user != null) {
        await saveUserToFirestore(user);
      }
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(message: e.code.replaceAll(RegExp(r'-'), ' ')));
    }
  }

  Future<void> saveUserToFirestore(User user) async {
    final userDoc = FirebaseFirestore.instance.collection('user').doc(user.uid);

    final docSnapshot = await userDoc.get();

    if (!docSnapshot.exists) {
      await userDoc.set({
        "uid": user.uid,
        "name": user.displayName ?? "",
        "email": user.email ?? "",
        "phone": user.phoneNumber ?? "",
        "address": "",
      });
    }
  }

  Future<void> sendPasswordResetEmail() async {
    emit(ForgetPasswordLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      emit(ForgetPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      emit(
        ForgetPasswordFailure(message: e.code.replaceAll(RegExp(r'-'), ' ')),
      );
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }
}
