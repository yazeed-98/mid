import '' 'package:flutter/material.dart';

import 'package:mid/pill.dart';
import 'package:mid/screen3.dart';
import 'package:mid/spoort.dart';

import 'SCREEN4.dart';
import 'login.dart';

class screen extends StatefulWidget {
  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        centerTitle: true,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 65),
          child: Row(
            children: [
              Icon(Icons.add_circle, size: 40),
              Text("Pill", style: TextStyle(fontSize: 40, color: Colors.red)),
              Text("Point", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40))
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(0, 40),
          child: Container(
            height: 40,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              children: [
                Icon(Icons.add_circle, size: 40, color: Colors.red),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text('Pharmacy', style: TextStyle(fontSize: 25)),
                ),
                Text('App', style: TextStyle(fontSize: 15, color: Colors.red,
                    fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(left: 37),
                  child: Icon(Icons.add_circle, size: 40, color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 400,
            height: 230,
            child: Image.asset('assets/image/screen4.jpg', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildElevatedButton(icon: Icons.local_pharmacy, label: 'Pharmacy', onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PharmacyListScreen()));
                }),
                _buildElevatedButton(icon: Icons.medication, label: 'Medication', onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MedicineScreen()));
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildElevatedButton(icon: Icons.alarm, label: 'pillAlarm', onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pill(),));
                }),
                _buildElevatedButton(icon: Icons.support_agent, label: 'Support', onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Support()));
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: _buildElevatedButton(icon: Icons.logout, label: 'Log OUT', onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login()));
            }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightGreenAccent,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.brown.shade800,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (v) {
          setState(() {
            index = v;
          });
        },
      ),

    );
  }

  Widget _buildElevatedButton({required IconData icon, required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: 120,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade100,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: Colors.red.shade900),
            SizedBox(width: 5),
            Text(label, style: TextStyle(fontWeight: FontWeight.w900, color: Colors.red, fontSize: 17)),
          ],
        ),
      ),
    );
  }
}