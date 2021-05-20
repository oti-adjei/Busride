import 'package:flutter/material.dart';
import 'package:travel_app/Booking.dart';
import 'package:travel_app/splashscreen.dart';
import 'package:travel_app/login.dart';
import 'package:travel_app/FadeAnimation.dart';

void main() => runApp(MyApp());

bool flightSelected = false, hotelSelected = false;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Raleway'),
      home: Splash(),
      routes: {
        '/splash': (context) => Splash(),
        '/booking': (context) => Booking(),
        '/login': (context) => Login(),
      },
    );
  }
}

