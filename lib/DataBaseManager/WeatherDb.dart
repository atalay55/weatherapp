import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/Entity/Data.dart';
import 'package:weatherapp/Entity/DataMain.dart';
import 'package:weatherapp/Entity/ShowData.dart';
import 'package:weatherapp/Entity/Weather.dart';
import 'package:weatherapp/Entity/Wind.dart';

class WeatherDb{
  //late String lon;
  //late String lat;
 late String city;
  WeatherDb.empty();
  WeatherDb({required this.city});
   late var api="https://api.openweathermap.org/data/2.5/weather?q=$city&mode=json&lang=tr&units=metric&appid=5182932598184f565bfefefc050d3829";
  //late var api= "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=5182932598184f565bfefefc050d3829";

  Future<List<Weather>> parseData(String response)async{
    return Data.jsonFrom(json.decode(response)).weather!;
  }
  Future<DataMain> parseDataMain(String response)async{
    return Data.jsonFrom(json.decode(response)).datamain!;
  }
   Future<String> parseName(String response)async{
     return Data.jsonFrom(json.decode(response)).name!;
  }
 Future<Wind> parseWind(String response)async{
   return Data.jsonFrom(json.decode(response)).wind!;
 }
  Future<List<Weather>> getWeather()async{
    var url=Uri.parse(api);
    var response=await http.get(url);
    return parseData(response.body);
  }

  Future<DataMain> getDataMain()async{
    var url=Uri.parse(api);
    var response=await http.get(url);
    return parseDataMain(response.body);
  }
 Future<Wind> getWind()async{
   var url=Uri.parse(api);
   var response=await http.get(url);
   return parseWind(response.body);
 }
  Future<String> getCityName()async{

    var url=Uri.parse(api);
    var response=await http.get(url);
    return parseName(response.body);
  }

  Future<ShowData> getShowData()async{

    var citName= await getCityName();
    var weatherMain =await getWeather();
    var temp = await getDataMain();
    var wind = await getWind();


    return ShowData(cityName: citName, weatherMain: weatherMain.first.main, weatherMainDescription: weatherMain.first.description, temp: temp.temp, pressure: temp.pressure,windSpeed:wind.speed! );
  }



}