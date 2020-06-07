import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WorldTime(),
  ));
}

class WorldTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
