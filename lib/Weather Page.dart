import 'package:flutter/material.dart';
import 'package:weatherapp/CardPage.dart';
import 'package:weatherapp/DataBaseManager/WeatherDb.dart';
import 'package:weatherapp/Entity/ShowData.dart';

class WeatherPage extends StatefulWidget {

  late String  city;
  late String lat;
  late String lon;
  late bool withLoc=false;

  WeatherPage.geo({required this.lat,required this.lon,required this.withLoc});

  WeatherPage({required this.city});

  @override

  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  late String image;

  @override
  Widget build(BuildContext context) {

    print(widget.withLoc);
    return Scaffold(
      appBar:AppBar(title: Text("Weather",style: TextStyle(fontSize: 21))
      ,backgroundColor: Colors.deepPurple) ,
      body:Center(
        child: FutureBuilder(
          future:  widget.withLoc ?WeatherDb.geo(lat: widget.lat, lon: widget.lon).getShowDataWithLoc():WeatherDb(city: widget.city).getShowData(),
          builder: (context,snapshot){

            if(snapshot.hasData){

              ShowData data = snapshot.data as ShowData;
              print(data.weatherMain);
              switch(data.weatherMain){
                case "Clouds": {image="Image/Clouds.png";}
                break;
                case "Rain": {image="Image/rain.png";}
                break;
                case "Clear": {image="Image/clear.png";}
                break;
                case "Snow": {image="Image/snow.png";}
                break;
                case "Mist": {image="Image/sisli.png";}
                break;
              }


              return CardPage(showData: data, img: image );
            }
            return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            );
          },
        )
      ),backgroundColor: Colors.white
      ,);
  }
}
