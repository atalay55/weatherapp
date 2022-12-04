import 'package:flutter/material.dart';
import 'package:weatherapp/CardPage.dart';
import 'package:weatherapp/DataBaseManager/WeatherDb.dart';
import 'package:weatherapp/Entity/ShowData.dart';

class WeatherPage extends StatefulWidget {

  late String lon;
  late String lat;

  WeatherPage({required this.lon,required this.lat});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    WeatherDb(lat:widget.lat,lon: widget.lon );
  }

  late String image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("")) ,
      body:Center(
        child: FutureBuilder(
          future: WeatherDb(lat:widget.lat,lon: widget.lon ).getShowData(),
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
              }
              print(image);

              return CardPage(showData: data,img: image);
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
