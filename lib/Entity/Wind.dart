class Wind{
  late double? speed;


  Wind({required this.speed});

  factory Wind.jsonFrom(Map<String,dynamic> json){
    return Wind(speed: json["speed"] as double  );
  }
}