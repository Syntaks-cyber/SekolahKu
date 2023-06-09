import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

typedef FutureVoidCallback = FutureOr<void> Function(AppLifecycleState state);

class LifecycleEventHandler extends WidgetsBindingObserver{
  final FutureVoidCallback onResume;
  final FutureVoidCallback onInactive;

  LifecycleEventHandler(this.onResume, this.onInactive);

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch(state){
      case AppLifecycleState.resumed:
        await onResume(state);
        break;
      case AppLifecycleState.inactive:
        await onInactive(state);
        break;
      case AppLifecycleState.paused:
      // TODO: Handle this case.
        break;
      case AppLifecycleState.detached:
      // TODO: Handle this case.
        break;
    }
  }
}