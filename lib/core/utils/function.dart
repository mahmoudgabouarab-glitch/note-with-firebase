import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool get isVerify => FirebaseAuth.instance.currentUser!.emailVerified == true;

bool get isLogin => FirebaseAuth.instance.currentUser != null && isVerify;

bool isArabic(BuildContext context) {
  if (Locale("ar") == context.locale) {
    return true;
  } else {
    return false;
  }
}
