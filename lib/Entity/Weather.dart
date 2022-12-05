class Weather{

  late int? id;
  late String? main;
  late String? description;
  late String? icon;

  Weather({required this.id,required this.main, required this.description,required this.icon});

  factory Weather.jsonFrom(Map<String,dynamic> json){
    return Weather(id: json["id"] as int, main: json["main"] as String, description: json["description"] as String, icon: json["icon"] as String);
  }

}