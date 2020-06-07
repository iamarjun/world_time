import 'package:flutter/material.dart';
import 'package:worldtime/screens/chooose_location.dart';
import 'package:worldtime/screens/home.dart';
import 'package:worldtime/screens/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}

class WorldTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
