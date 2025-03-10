import 'package:flutter/material.dart';
import 'package:mid/screen.dart';

import 'TIXT.dart';

class Login extends StatefulWidget {

  String? email;
  String? pass;

  Login ({this.email,this.pass});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>(); // Moved inside _LoginState

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        centerTitle: true,
        title: Text(
          'LOGIN',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity, // Makes the image responsive
                      height: 400,
                      child: Image.asset(
                        'assets/image/screen.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Tixt
                            (label: 'user name',
                            hint: 'exampel yazeedbdour@gmail.com',
                            prefixIcon: Icons.person,
                            enabledBorderColor: Colors.black26,
                            focusedBorderColor: Colors.black26, controller: TextEditingController(),
                            border: 30,
                            border1: 30,
                            onSaved: (email1) {
                              widget.email=email1;
                            },
                          ),
                          SizedBox(height: 15),
                          Tixt(
                            label: 'password',
                            hint: '/@#1234yaw',
                            prefixIcon: Icons.password,
                            enabledBorderColor: Colors.red.shade100
                            , focusedBorderColor: Colors.pink.shade100,
                            suffixIcon: Icons.remove_red_eye_outlined, controller: TextEditingController(),
                            border: 30,
                            border1: 30,
                            onSaved: (passw) {
                              widget.pass=passw;
                            },),


                        ],
                      ),
                    )],
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade200
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate())

                    {
                      _formKey.currentState!.save();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Screen()));

                    }
                  },
                  child: Text('Login'), // Fixed button label
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
