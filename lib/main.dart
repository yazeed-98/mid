import 'package:flutter/material.dart';

import 'screen1.dart';

main () {

  runApp(Main());

}



class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen1(),  );

  }
}
