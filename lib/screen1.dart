import 'package:flutter/material.dart';

import 'login.dart';



class Screen1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
          children : [ Container(

            height: double.infinity,
            width: double.infinity,
            child: Image(image: AssetImage('assets/image/screen2.jpeg',
            ),
              fit:BoxFit.cover,),

          ),
            Center(

                child:

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 30),

                        child: ElevatedButton(onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login()));
                        }, child: Text('Lets GO'))),
                  ],
                ))
          ]
      ),


    );
  }
}
