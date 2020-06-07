import 'dart:convert';

import 'package:http/http.dart';
import 'package:worldtime/model/Location.dart';

import '../model/WorldTime.dart';

class API {
  Future<WorldTime> getTime(String endPoint) async {
    Response response =
        await get('http://worldtimeapi.org/api/timezone/$endPoint');

    return WorldTime.fromJsonMap(jsonDecode(response.body));
  }

  Future<Location> getLocations() async {
    Response response = await get('http://worldtimeapi.org/api/timezone');
    return Location.fromJsonMap(jsonDecode(response.body));
  }
}
