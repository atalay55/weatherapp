import 'package:flutter/material.dart';
import 'package:weatherapp/Entity/Clouds.dart';
import 'package:weatherapp/Entity/Coord.dart';
import 'package:weatherapp/Entity/DataMain.dart';
import 'package:weatherapp/Entity/Sys.dart';
import 'package:weatherapp/Entity/Weather.dart';
import 'package:weatherapp/Entity/Wind.dart';

class Data{
  late Coord coord;
  late List<Weather> weather;
  late String base;
  late DataMain datamain;
  late int visibility;
  late Clouds clouds;
  late Wind wind;
  late int dt;
  late Sys sys;
  late int timeZone;
  late int id;
  late String name;
  late int cod;

  Data({required this.coord,required this.weather,required this.base,required this.wind,required this.datamain,required this.visibility,required this.clouds,required this.dt,required this.sys,required this.timeZone,required this.id,
    required this.name,required this.cod,});

  factory Data.jsonFrom(Map<String,dynamic>json){

    var jsonArray=json["weather"] as List;
    List<Weather> weather=jsonArray.map((e) => Weather.jsonFrom(e)).toList();
    print(Sys.jsonFrom(json["sys"]));
    return Data(
        coord:Coord.jsonFrom(json["coord"]) ,
        weather:weather,
        base: json["base"] ,
        datamain: DataMain.jsonFrom(json["main"]),
        visibility: json["visibility"],
        clouds: Clouds.jsonFrom(json["clouds"]),
        dt: json["dt"] ,
        wind: Wind.jsonFrom(json["wind"]),
        sys: Sys.jsonFrom(json["sys"]),
        timeZone:json["timezone"] ,
        id: json["id"],
        name: json["name"] ,
        cod: json["cod"]  );
  }

}