import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/model/WorldTime.dart';
import 'package:worldtime/service/api.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  API api = API();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[900],
        body: FutureBuilder<WorldTime>(
      future: api.getTime('Asia/Kolkata').then((value) {
        print(value);
        Navigator.pushReplacementNamed(context, '/home', arguments: {
          'world time': value,
        });
        return value;
      }),
      builder: (BuildContext context, AsyncSnapshot<WorldTime> snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? Container()
            : Center(child: SpinKitWave(
          color: Colors.white,
          size: 50,
        ));
      },
    ));
  }
}
