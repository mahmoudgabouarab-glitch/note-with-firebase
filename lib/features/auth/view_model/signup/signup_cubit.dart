import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  final TextEditingController userName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  Future<void> signupWithEmailAndPassword() async {
    emit(SignupLoading());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.text,
            password: password.text,
          );
      final uid = credential.user!.uid;

      await FirebaseFirestore.instance.collection('user').doc(uid).set({
        'uid': uid,
        'name': userName.text,
        'phone': phone.text,
        'address': address.text,
        'email': email.text,
        'createdAt': FieldValue.serverTimestamp(),
        'token': await FirebaseMessaging.instance.getToken(),
      });
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      emit(SignupSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignupFailure(message: e.code.replaceAll(RegExp(r'-'), ' ')));
    }
  }

  @override
  Future<void> close() {
    userName.dispose();
    phone.dispose();
    address.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    return super.close();
  }
}
