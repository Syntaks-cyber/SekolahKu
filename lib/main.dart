import 'package:flutter/material.dart';
import 'package:sekolahku/screens/home_screen.dart';
import 'package:sekolahku/services/app_services.dart';
import 'package:sekolahku/utils/lifecycle_event_handler.dart';
import 'screens/splash_screen.dart';
//import 'screens/login_screen.dart';
//import 'screens/home_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isDatabaseReady = false;
  LifecycleEventHandler _lifecycleEventHandler;

  @override
  void initState(){
    super.initState();
    AppServices.openDb().then((value){
      setState((){
        isDatabaseReady = true;
      });
    });

    _lifecycleEventHandler = LifecycleEventHandler(
      onResume,
      onInactive,
    );
    WidgetsBinding.instance.addObserver(_lifecycleEventHandler);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_lifecycleEventHandler);

    AppServices.closeDb().then((value){
      setState(() {
        isDatabaseReady = false;
      });
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.indigo.shade900),
      home: isDatabaseReady
          ? HomePage()
          : Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          )),
    );
  }

  Future<void> onResume(AppLifecycleState state){
    return AppServices.openDb().then((value){
      setState(() {
        isDatabaseReady == true;
      });
      return isDatabaseReady;
    }
    );
  }

  Future<void> onInactive(AppLifecycleState state){
    return AppServices.openDb().then((value){
      setState(() {
        isDatabaseReady == false;
      });
      return isDatabaseReady;
    }
    );
  }
}