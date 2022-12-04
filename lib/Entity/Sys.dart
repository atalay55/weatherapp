class Sys{
  late int type;
  late int id;
  late String country;
  late int sunrise;
  late int sunset;

  Sys({required this.type,required this.id,required this.country,required this.sunrise,required this.sunset});

  factory Sys.jsonFrom(Map<String,dynamic> json){
    return Sys(type: json["type"]as int, id: json["id"]as int, country: json["country"]as String,
        sunrise: json["sunrise"]as int, sunset: json["sunset"]as int);
  }
}