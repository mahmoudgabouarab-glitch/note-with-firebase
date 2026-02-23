import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/network/bloc_observer.dart';
import 'package:onlyproject/core/network/local_notification_service.dart';
import 'package:onlyproject/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp();
  await LocalNotificationService.initialize();
  runApp(MyApp());
}
