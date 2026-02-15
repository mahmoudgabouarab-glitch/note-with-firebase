import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    if (kDebugMode) {
      debugPrint('🧱 BLOC CREATED → ${bloc.runtimeType}');
    }
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    if (kDebugMode) {
      debugPrint('🎯 EVENT → ${bloc.runtimeType}: $event');
    }
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      debugPrint(
        '🔄 STATE CHANGE → ${bloc.runtimeType}\n'
        '   from: ${change.currentState}\n'
        '   to:   ${change.nextState}',
      );
    }
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      debugPrint(
        '❌ BLOC ERROR → ${bloc.runtimeType}\n'
        '   error: $error',
      );
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    if (kDebugMode) {
      debugPrint('🧹 BLOC CLOSED → ${bloc.runtimeType}');
    }
    super.onClose(bloc);
  }
}