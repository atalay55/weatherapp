class DataMain{

  late double? temp;
  late double? feelsLike;
  late double? tempMin;
  late double? tempMax;
  late int? pressure;
  late int? humidity;


  DataMain({ required this.temp, required this.feelsLike,required this.tempMin, required this.tempMax,
     required this.pressure, required this.humidity});


  factory DataMain.jsonFrom(Map<String,dynamic> json){
    return DataMain( temp: json["temp"] as double, feelsLike: json["feels_like"] as double, tempMin:  json["temp_min"] as double,
        tempMax: json["temp_max"] as double,pressure:   json["pressure"] as int, humidity:  json["humidity"] as int);
  }


}