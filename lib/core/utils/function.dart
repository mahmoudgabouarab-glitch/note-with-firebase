import 'package:firebase_auth/firebase_auth.dart';

bool get isVerify => FirebaseAuth.instance.currentUser!.emailVerified == true;

bool get isLogin => FirebaseAuth.instance.currentUser != null && isVerify;
