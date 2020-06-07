class Location {
  List<dynamic> locations;

  Location.fromJsonMap(List<dynamic> list) : locations = list;

  List<String> toJson() {
    final List<dynamic> data = new List<dynamic>();
    data.addAll(locations);
    return data;
  }
}
