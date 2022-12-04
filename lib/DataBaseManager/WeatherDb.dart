import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/Entity/Data.dart';
import 'package:weatherapp/Entity/DataMain.dart';
import 'package:weatherapp/Entity/ShowData.dart';
import 'package:weatherapp/Entity/Weather.dart';

class WeatherDb{
  late String lon;
  late String lat;

  WeatherDb.empty();
  WeatherDb({required this.lon, required this.lat});

  late var api= "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=5182932598184f565bfefefc050d3829";

  Future<List<Weather>> parseData(String response)async{
    return Data.jsonFrom(json.decode(response)).weather;
  }
  Future<DataMain> parseDataMain(String response)async{
    return Data.jsonFrom(json.decode(response)).datamain;
  }
   Future<String> parseName(String response)async{
     return Data.jsonFrom(json.decode(response)).name;
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
  Future<String> getCityName()async{

    var url=Uri.parse(api);
    var response=await http.get(url);


    return parseName(response.body);
  }

  Future<ShowData> getShowData()async{

    var citName= await getCityName();
    var weatherMain =await getWeather();
    var temp = await getDataMain();


    return ShowData(cityName: citName, weatherMain: weatherMain.first.main, weatherMainDescription: weatherMain.first.description, temp: temp.temp, pressure: temp.pressure);
  }



}