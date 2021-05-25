import 'dart:async';
import 'package:flutter/material.dart';
import 'package:msa/screens/homescreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 1),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 290),
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/appstore.png',
                    height: 100,
                    color: Color.fromRGBO(9, 172, 91, 1),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Multiple Sequence Alignment',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'MSA',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}