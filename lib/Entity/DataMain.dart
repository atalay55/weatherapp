class DataMain{

  late double? temp;
  late double? feels_like;
  late double? temp_min;
  late double? temp_max;
  late int? pressure;
  late int? humidity;


  DataMain({ required this.temp, required this.feels_like,required this.temp_min, required this.temp_max,
     required this.pressure, required this.humidity});


  factory DataMain.jsonFrom(Map<String,dynamic> json){
    return DataMain( temp: json["temp"] as double, feels_like: json["feels_like"] as double, temp_min:  json["temp_min"] as double,
         temp_max: json["temp_max"] as double,pressure:   json["pressure"] as int, humidity:  json["humidity"] as int);
  }


}