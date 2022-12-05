class Coord{
  late double? lon;
  late double? lat;
  Coord({required this.lon,required this.lat});

  factory Coord.jsonFrom(Map<String,dynamic> json){
    return Coord(lon: json["lon"] as double, lat: json["lat"] as double);
  }
}