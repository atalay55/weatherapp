class Clouds{
  late int all;
  Clouds({required this.all});

  factory Clouds.jsonFrom(Map<String,dynamic> json){
    return Clouds(all: json["all"] as int);
  }
} 