import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sekolahku/screens/login_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), () =>  Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => LoginPage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff329cef),
      body: Center(
          child: Container(
            width: 130,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/sekolah.png")
                )
            ),
          )
      ),
    );
  }
}