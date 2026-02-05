import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Body Health Calculator',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/calculator.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (ฺBMI)',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                Text(
                  'คำนวณหาปริมาณแคลอรี่ที่ร่างกายต้องการในแต่ละวัน (BMR)',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
              ],
            ),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/4/47/Logosau-02.png',
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover),
              SizedBox(
                height: 20,
              ),
              Text(
                'Developed by : Thitipong SAU 2026',
              ),
              SizedBox(
                height: 40,
              )
            ],
          ))
        ],
      ),
    );
  }
}
