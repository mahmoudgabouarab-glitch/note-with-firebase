import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  CollectionReference users = FirebaseFirestore.instance.collection('user');

  Future<void> signupWithEmailAndPassword() async {
    emit(SignupLoading());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.text,
            password: password.text,
          );
      final uid = credential.user!.uid;

      await users.doc(uid).set({
        'uid': uid,
        'name': userName.text,
        'phone': phone.text,
        'address': address.text,
        'email': email.text,
        'createdAt': FieldValue.serverTimestamp(),
      });
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      emit(SignupSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignupFailure(message: e.code.replaceAll(RegExp(r'-'), ' ')));
    }
  }
}
