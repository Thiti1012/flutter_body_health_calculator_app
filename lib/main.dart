import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/splash_screen_ui.dart';

void main() {
  runApp(
    //เรียกใช้คลาสที่เรียกใช้ widget หลักของแอป (MaterialApp)
    FlutterBodyHealthCalculatorApp(),
  );
}

class FlutterBodyHealthCalculatorApp extends StatefulWidget {
  const FlutterBodyHealthCalculatorApp({super.key});

  @override
  State<FlutterBodyHealthCalculatorApp> createState() =>
      _FlutterBodyHealthCalculatorAppState();
}

class _FlutterBodyHealthCalculatorAppState
    extends State<FlutterBodyHealthCalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ), //text theme
      ), //theme data
    ); //material app
  } //build
} //FlutterBodyHealthCalculatorApp
