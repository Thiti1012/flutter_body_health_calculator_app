import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_app/views/home_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    // ให้หน้าจอสแปลชแสดงผลเป็นเวลา 3 วินาที แล้วเปลี่ยนไปยังหน้า HomeUi
    Future.delayed(
      //เวลาที่หน่วง
      Duration(seconds: 3),
      //เมื่อครบเวลาให้เปลี่ยนหน้า
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeUi(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/calculator.png',
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Body Health Calculator',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.025,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
