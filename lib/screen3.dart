import 'package:flutter/material.dart';
import 'package:mid/shop.dart';

import 'TIXT.dart';
import 'mad.dart';

class MedicineScreen extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? pass;

  MedicineScreen({this.email, this.pass});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  final List<Map<String, String>> medicines = [
    {'name': 'Paracetamol', 'description': 'Pain reliever and fever reducer', 'price': '\$5'},
    {'name': 'Amoxicillin', 'description': 'Antibiotic for bacterial infections', 'price': '\$12'},
    {'name': 'Ibuprofen', 'description': 'Anti-inflammatory painkiller', 'price': '\$8'},
    {'name': 'Cetirizine', 'description': 'Antihistamine for allergies', 'price': '\$6'},
    {'name': 'Omeprazole', 'description': 'Reduces stomach acid', 'price': '\$15'},
    {'name': 'Metformin', 'description': 'Lowers blood sugar levels', 'price': '\$10'},
    {'name': 'Atorvastatin', 'description': 'Reduces cholesterol', 'price': '\$18'},
    {'name': 'Losartan', 'description': 'Lowers blood pressure', 'price': '\$14'},
    {'name': 'Aspirin', 'description': 'Blood thinner and pain reliever', 'price': '\$7'},
    {'name': 'Loratadine', 'description': 'Antihistamine for hay fever', 'price': '\$9'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 120, top: 20),
          child: Text(
            'Medicines',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(0, 50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Tixt(
              label: 'Medicines',
              hint: 'example voltaren',
              prefixIcon: Icons.search,
              enabledBorderColor: Colors.red,
              focusedBorderColor: Colors.orange,
              border: 20,
              iconColor: Colors.red,
              suffixIcon: Icons.notification_add_rounded,
              sufColor: Colors.red,
              border1: 30,
              controller: TextEditingController(),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.orange.shade50,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CartScreen(cartItems: [
                    {'name': 'Paracetamol', 'price': 5.0},
                    {'name': 'Ibuprofen', 'price': 8.0},
                  ]),
            ),
          );
        },

        backgroundColor: Colors.blue.shade300,
        focusColor: Colors.red,
        splashColor: Colors.red,
        foregroundColor: Colors.red,
        child: Icon(
          Icons.shopping_cart_outlined,
          color: Colors.red,
          size: 35,
        ),
      ),
      body: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shadowColor: Colors.grey,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            ),
            onPressed: () {
              // يمكنك تنفيذ وظيفة هنا عند النقر على الدواء
            },
            child: Mad(
              name: medicines[index]['name'] ?? 'Unknown',
              description: medicines[index]['description'] ?? 'No description available',
              price: medicines[index]['price'] ?? '\$0',
            ),
          );
        },
      ),
    );
  }
}
