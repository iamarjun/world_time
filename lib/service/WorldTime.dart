import 'dart:convert';

import 'package:http/http.dart';

class WorldTime {
  String location;
  String endPoint;

  String abbreviation;
  String client_ip;
  String datetime;
  int day_of_week;
  int day_of_year;
  bool dst;
  Object dst_from;
  int dst_offset;
  Object dst_until;
  int raw_offset;
  String timezone;
  int unixtime;
  String utc_datetime;
  String utc_offset;
  int week_number;

  WorldTime({this.location, this.endPoint})

  WorldTime.fromJsonMap(Map<String, dynamic> map)
      : abbreviation = map["abbreviation"],
        client_ip = map["client_ip"],
        datetime = map["datetime"],
        day_of_week = map["day_of_week"],
        day_of_year = map["day_of_year"],
        dst = map["dst"],
        dst_from = map["dst_from"],
        dst_offset = map["dst_offset"],
        dst_until = map["dst_until"],
        raw_offset = map["raw_offset"],
        timezone = map["timezone"],
        unixtime = map["unixtime"],
        utc_datetime = map["utc_datetime"],
        utc_offset = map["utc_offset"],
        week_number = map["week_number"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abbreviation'] = abbreviation;
    data['client_ip'] = client_ip;
    data['datetime'] = datetime;
    data['day_of_week'] = day_of_week;
    data['day_of_year'] = day_of_year;
    data['dst'] = dst;
    data['dst_from'] = dst_from;
    data['dst_offset'] = dst_offset;
    data['dst_until'] = dst_until;
    data['raw_offset'] = raw_offset;
    data['timezone'] = timezone;
    data['unixtime'] = unixtime;
    data['utc_datetime'] = utc_datetime;
    data['utc_offset'] = utc_offset;
    data['week_number'] = week_number;
    return data;
  }

  Future<WorldTime> getTime() async {
    Response response =
        await get('http://worldtimeapi.org/api/timezone/$endPoint');

    return WorldTime.fromJsonMap(jsonDecode(response.body));
  }
}
