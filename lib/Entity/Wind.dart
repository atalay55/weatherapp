class Wind{
  late double speed;
  late int deg;
  late double gust;

  Wind({required this.speed, required this.deg,required this.gust});

  factory Wind.jsonFrom(Map<String,dynamic> json){
    return Wind(speed: json["speed"] as double , deg: json["deg"] as int , gust: json["gust"] as double );
  }
}