class DataMain{

  late double temp;
  late double feels_like;
  late double temp_min;
  late double temp_max;
  late int pressure;
  late int humidity;


  DataMain( this.temp, this.feels_like, this.temp_min, this.temp_max,
     this.pressure, this.humidity);


  factory DataMain.jsonFrom(Map<String,dynamic> json){
    return DataMain( json["temp"] as double, json["feels_like"] as double,  json["temp_min"] as double,
         json["temp_max"] as double,  json["pressure"] as int,  json["humidity"] as int,);
  }


}