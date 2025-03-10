import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>>? cartItems;

  CartScreen({this.cartItems});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // توفير قائمة افتراضية في حال كانت cartItems تساوي null
    final List<Map<String, dynamic>> cartItems = widget.cartItems ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('Cart is empty 🛒'))
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index]['name']),
            subtitle: Text("Price: \$${cartItems[index]['price']}"),
          );
        },
      ),
    );
  }
}
