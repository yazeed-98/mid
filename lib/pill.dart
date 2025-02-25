import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mid/screen.dart';
import 'package:mid/shop.dart';

import 'SCREEN4.dart';
import 'login.dart';

class Pill extends StatefulWidget {
  @override
  State<Pill> createState() => _PillState();
}

class _PillState extends State<Pill> {
  final List<Widget> pages = [
    screen(),
    PharmacyListScreen(),
    CartScreen(),
    Login(),
  ];

  final TextEditingController _medicineController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        bottom: PreferredSize(
          preferredSize: Size(0, 20),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'AlarM',
                  style: TextStyle(fontSize: 30),
                ),
                Icon(
                  Icons.alarm,
                  color: Colors.red,
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // صورة الخلفية
            Image.asset('assets/images/images(1).jpeg'),

            SizedBox(height: 20),
            // حقل إدخال اسم الدواء
            TextField(
              controller: _medicineController,
              decoration: InputDecoration(
                labelText: 'Name of the medicine',
                hintText: 'Clozobin',
                prefixIcon: Icon(Icons.medication_liquid, color: Colors.red),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade300),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.blue.shade100,
              ),
            ),
            SizedBox(height: 20),
            // حقل إدخال وقت تناول الدواء
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                labelText: 'Eating time',
                hintText: 'Daily, 5:30 PM',
                prefixIcon: Icon(CupertinoIcons.clock_fill, color: Colors.red),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade100),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.blue.shade100,
              ),
            ),
            SizedBox(height: 30),
            // زر الحفظ
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade100,
                fixedSize: Size(150, 50),
              ),
              onPressed: () {
                String medicineName = _medicineController.text.trim();
                String eatingTime = _timeController.text.trim();

                if (medicineName.isNotEmpty && eatingTime.isNotEmpty) {
                  savePillData(medicineName, eatingTime);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter all required fields.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text('Adjust'),
            ),
            SizedBox(height: 20),
            // زر تسجيل الخروج
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade100,
                fixedSize: Size(150, 40),
              ),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Login()),
                      (route) => false,
                );
              },
              child: Text('Log out'),
            ),
            // عرض الصفحة المناسبة حسب الفهرس
            Expanded(
              child: IndexedStack(
                index: index,
                children: pages,
              ),
            ),
          ],
        ),
      ),
      // شريط التنقل السفلي
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightGreenAccent,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.brown.shade800,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.medical_information_outlined), label: 'Pharmacy'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
        ],
        onTap: (v) {
          setState(() {
            index = v;
          });
        },
      ),
    );
  }

  void savePillData(String medicine, String time) {
    print('Medicine: $medicine');
    print('Eating Time: $time');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Medicine Reminder Saved: $medicine at $time'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
