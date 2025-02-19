import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final  List<Map<String, dynamic>>? cartItems;
  CartScreen({ this.cartItems});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping Cart'),
        backgroundColor: Colors.blue.shade100,

      ),
      body: widget.cartItems!.isEmpty
          ? Center(child: Text('Cart is empty 🛒'))
          : ListView.builder(
        itemCount: widget.cartItems?.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.cartItems?[index]['name']),
            subtitle: Text("Price: \$${widget.cartItems?[index]['price']}"),
          );
        },
      ),
    );
  }
}
