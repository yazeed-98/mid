import 'package:flutter/material.dart';

import 'TIXT.dart';
import 'login.dart';

class Register extends StatefulWidget {

  String? email;
  String? pass;

  Register ({this.email,this.pass});




  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // مفتاح النموذج للتحقق من الإدخال
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xcdf3b2b8),
        appBar: AppBar(
          backgroundColor: Color(0xcdf3b2b8),
          centerTitle: true,
          title: Text('Register',
            style: TextStyle(
                fontWeight: FontWeight.w700
            ),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // ربط المفتاح بالنموذج
            child: Column(

              children: [
                Stack(
                    children:[ Container(
                      width:450,
                      height: 400,
                      child: Image(image: AssetImage('assets/image/screen.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),


                      SizedBox(height: 20,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Tixt(label: 'user name', hint: 'exampel yazeedbdour@gmail.com',
                              onSaved: (email1) {
                                widget.email=email1;
                              },

                              prefixIcon: Icons.person, enabledBorderColor: Colors.black26, focusedBorderColor: Colors.black26, controller: TextEditingController(),),




                            SizedBox(height: 15,),

                            Container(

                                child: Tixt(label: 'password', hint: '/@#1234yaw', prefixIcon: Icons.password, enabledBorderColor: Colors.red.shade100
                                  , focusedBorderColor: Colors.pink.shade100,
                                  suffixIcon:Icons.remove_red_eye_outlined,
                                  onSaved: (passw) {
                                    widget.pass=passw;
                                  },
                                  controller: TextEditingController(),

                                )),
                            SizedBox(height: 15),
                            Tixt(label: 'Birth day', hint: '2000/6/28', prefixIcon: Icons.view_day, enabledBorderColor: Colors.red.shade100
                              , focusedBorderColor: Colors.pink.shade100, controller: TextEditingController(),

                            ),

                          ],
                        ),
                      ),
                    ]),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                      _formKey.currentState!.save();



                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login()));
                    }
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        )
    );
  }
}
