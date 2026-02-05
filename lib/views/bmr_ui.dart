import 'package:flutter/material.dart';

enum Gender { male, female }

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
  // ตัวควบคุม TextField
  TextEditingController wCtrl = TextEditingController();
  TextEditingController hCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();
  double bmrValue = 0;
  Gender? selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  'คำนวณอัตราการเผาผลาญ (BMR)',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Image.asset('assets/images/bmr.png',
                    width: 130, height: 130, fit: BoxFit.cover),
                SizedBox(height: 20),

                // เพศ
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เพศ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<Gender>(
                        title: Text('ชาย'),
                        value: Gender.male,
                        groupValue: selectedGender,
                        onChanged: (v) {
                          setState(() {
                            selectedGender = v;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<Gender>(
                        title: Text('หญิง'),
                        value: Gender.female,
                        groupValue: selectedGender,
                        onChanged: (v) {
                          setState(() {
                            selectedGender = v;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                // น้ำหนัก
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก (kg)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: wCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรุณากรอกน้ำหนักของคุณ',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  ),
                ),
                SizedBox(height: 10),

                // ส่วนสูง
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง (cm)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: hCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรุณากรอกส่วนสูงของคุณ',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  ),
                ),
                SizedBox(height: 10),

                // อายุ
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'อายุ (ปี)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ageCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรุณากรอกอายุของคุณ',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  ),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // คำนวณ
                    if (wCtrl.text.isEmpty ||
                        hCtrl.text.isEmpty ||
                        ageCtrl.text.isEmpty ||
                        selectedGender == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกข้อมูลให้ครบ'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 1),
                        ),
                      );
                      return;
                    }

                    try {
                      double w = double.parse(wCtrl.text);
                      double h = double.parse(hCtrl.text);
                      double age = double.parse(ageCtrl.text);

                      double bmr;
                      if (selectedGender == Gender.male) {
                        bmr = 66 + (13.7 * w) + (5 * h) - (6.8 * age);
                      } else {
                        bmr = 665 + (9.6 * w) + (1.8 * h) - (4.7 * age);
                      }

                      setState(() {
                        bmrValue = bmr;
                      });
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('ข้อมูลไม่ถูกต้อง กรุณากรอกตัวเลขเท่านั้น'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'คํานวณ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    textStyle: TextStyle(fontSize: 20),
                    fixedSize: Size(MediaQuery.of(context).size.width, 55),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      wCtrl.clear();
                      hCtrl.clear();
                      ageCtrl.clear();
                      selectedGender = Gender.male;
                      bmrValue = 0;
                    });
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    textStyle: TextStyle(fontSize: 20),
                    fixedSize: Size(MediaQuery.of(context).size.width, 55),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'BMR (kcal/day)',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        bmrValue.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
