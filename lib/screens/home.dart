import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:worldtime/model/WorldTime.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    WorldTime worldTime = data['world time'];
    var time = DateFormat.jm().format(DateTime.parse(worldTime.datetime));
    var location = worldTime.timezone;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/location'),
                icon: Icon(
                  Icons.edit_location,
                ),
                label: Text('Edit Location'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    location,
                    textScaleFactor: 2,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                time,
                textScaleFactor: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
