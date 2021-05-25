import 'package:flutter/material.dart';
import 'package:msa/screens/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      theme: ThemeData(primaryColor: Color.fromRGBO(9, 172, 91, 1)),
      home: SplashScreen(),
    );
  }
}
