import 'package:flutter/material.dart';
import 'package:weatherapp/CardPage.dart';
import 'package:weatherapp/DataBaseManager/WeatherDb.dart';
import 'package:weatherapp/Entity/ShowData.dart';

class WeatherPage extends StatefulWidget {

  late String city;


  WeatherPage({required this.city});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    WeatherDb(city:widget.city );
  }

  late String image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("")) ,
      body:Center(
        child: FutureBuilder(
          future: WeatherDb(city:widget.city).getShowData(),
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
