class Sys{

  late String? country;
  late int? sunrise;
  late int? sunset;

  Sys({required this.country,required this.sunrise,required this.sunset});

  factory Sys.jsonFrom(Map<String,dynamic> json){
    return Sys( country: json["country"]as String,
        sunrise: json["sunrise"]as int, sunset: json["sunset"]as int);
  }
}