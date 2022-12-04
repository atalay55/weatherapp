import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/Entity/ShowData.dart';

class CardPage extends StatelessWidget {
  late ShowData showData;
  late String img;
  late var pageWidth;

  CardPage({required this.showData,required this.img});
  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(top:pageWidth/5),
          child: SizedBox(
            width: pageWidth/2,
            height: pageWidth/2,
            child: Card(
              color: Colors.grey,
              child: Column(
                children: [
                  SizedBox(
                      height: pageWidth/2.2,
                      width: pageWidth/2.2,
                      child: CircleAvatar(child: Image.asset(img),backgroundColor: Colors.grey,)),
                ],
              ), shape: RoundedRectangleBorder(side: BorderSide.none,
            borderRadius: BorderRadius.circular(15.0),)
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(showData.cityName,style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Weather : ${showData.weatherMain}",style:TextStyle(fontSize: 25,color: Colors.black)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Description :  ${showData.weatherMainDescription}",style:TextStyle(fontSize: 20,color: Colors.black)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Temperature :  ${showData.temp} °C",style:TextStyle(fontSize: 20,color: Colors.black)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Wind speed :  ${showData.windSpeed} ",style:TextStyle(fontSize: 20,color: Colors.black)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Pressure :  ${showData.pressure}  Pa",style:TextStyle(fontSize: 20,color: Colors.black)),
        ),

      ],
    );
  }
}


