import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/model/Location.dart';
import 'package:worldtime/model/WorldTime.dart';
import 'package:worldtime/service/api.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  API api = new API();

  void updateTime(String endPoint) async {
    WorldTime worldTime = await api.getTime(endPoint);
    Navigator.pop(context, {'world time': worldTime});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.amber[900],
          title: Text('Choose Location'),
          centerTitle: true,
        ),
        body: FutureBuilder<Location>(
          future: api.getLocations(),
          builder: (BuildContext context, AsyncSnapshot<Location> snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.locations.length,
                    itemBuilder: (context, index) => Card(
                          elevation: 4,
                          margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                          child: ListTile(
                            onTap: () =>
                                this.updateTime(snapshot.data.locations[index]),
                            title: Text(snapshot.data.locations[index]),
                          ),
                        ))
                : Center(
                    child: SpinKitPulse(
                    color: Colors.amber[900],
                    size: 50,
                  ));
          },
        ));
  }
}
