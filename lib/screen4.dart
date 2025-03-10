import 'package:flutter/material.dart';
import 'package:mid/screen.dart';
import 'package:mid/shop.dart';
import 'package:mid/spoort.dart';

import 'TIXT.dart';


class PharmacyListScreen extends StatefulWidget {
  @override
  State<PharmacyListScreen> createState() => _PharmacyListScreenState();
}

class _PharmacyListScreenState extends State<PharmacyListScreen> {
  final List<Map<String, String>> pharmacies = [
    {'name': 'Green Health Pharmacy', 'address': '123 Main St, Irbid', 'phone': '+962 7 9012 3456'},
    {'name': 'Al Shifa Pharmacy', 'address': '456 King Abdullah St, Irbid', 'phone': '+962 7 5678 9012'},
    {'name': 'Irbid Care Pharmacy', 'address': '789 University Rd, Irbid', 'phone': '+962 7 3456 7890'},
    {'name': 'City Life Pharmacy', 'address': '321 Garden St, Irbid', 'phone': '+962 7 2233 4455'},
    {'name': 'Wellness Pharmacy', 'address': '654 Downtown Ave, Irbid', 'phone': '+962 7 1122 3344'},
  ];

  int index = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.orange.shade100,
      appBar: AppBar(

        backgroundColor: Colors.blue.shade200,

        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 120,
              top: 20),
          child: PreferredSize(preferredSize: Size(0, 20), child: Text('Pharmacy',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),)),
        ),



        bottom: PreferredSize(preferredSize: Size(0, 50), child:




        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

            child: Tixt(label: 'pharmacy', hint:'sar aldawa', prefixIcon: Icons.search,
              enabledBorderColor: Colors.green, focusedBorderColor: Colors.deepPurpleAccent,
              border: 30,
              iconColor: Colors.red,
              suffixIcon:Icons.notification_add_rounded,
              sufColor: Colors.red,
              border1: 30,
              controller: TextEditingController(),
            ),
          ),
        )

        ),
      ),


      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: pharmacies.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.blue.shade100,
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: ListTile(
              leading: Icon(Icons.local_pharmacy, color: Colors.red, size: 40),
              title: Text(
                pharmacies[index]['name']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                pharmacies[index]['address']!,
                style: TextStyle(fontSize: 15, color: Colors.red),
              ),
              trailing: IconButton(
                icon: Icon(Icons.call, color: Colors.blue),
                onPressed: () {
                  print('Calling ${pharmacies[index]['phone']}');
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightGreenAccent,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.brown.shade800,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.medical_information_outlined), label: 'Pharmacy'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'),
        ],
        onTap: (v) {
          setState(() {
            index = v;
            switch (index) {
              case 0:
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Screen(),));
              case 1:
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PharmacyListScreen (),));
              case 2:
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen (),));




            }
          });
        },
      ),

    );
  }
}
