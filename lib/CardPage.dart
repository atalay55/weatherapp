
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weatherapp/Entity/ShowData.dart';

class CardPage extends StatelessWidget {
  late ShowData showData;
  late String img;
  late String backImage;
  late var pageWidth;

  CardPage({required this.showData,required this.img});
  @override
  Widget build(BuildContext context) {

    pageWidth = MediaQuery.of(context).size.width;
    backImage=getBackImage(showData.weatherMain);
    return SingleChildScrollView(
      child: Container(
        height: pageWidth*2,
        width: pageWidth,
        decoration: BoxDecoration(
          image:DecorationImage(image: AssetImage(backImage),fit: BoxFit.cover,opacity: .8)
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: pageWidth/14),
              child: Text("${showData.cityName}",style: TextStyle(fontSize: 35,color: Colors.black) ,),
            ),
          Padding(
            padding: EdgeInsets.only(),
            child: SizedBox(
                height: pageWidth/2.1,
                width: pageWidth/2.1,
                child:  Image.asset(img)),
          ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text( "${showData.temp} °C " ,style:TextStyle(fontSize: 25,color: Colors.black)),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text( "${showData.weatherMain} " ,style:TextStyle(fontSize: 25,color: Colors.black)),
            ),
            SfCartesianChart(
                primaryXAxis: CategoryAxis( ),
                primaryYAxis: NumericAxis(),
                enableAxisAnimation:true,
                series: <ChartSeries>[
                  LineSeries<ChartData, String>(
                      dataSource: [
                        ChartData("Mon",17.5),
                        ChartData('Tue', 15.8),
                        ChartData('Wen',12),
                        ChartData('Thurs', showData.temp),
                        ChartData('Friday', 17)
                      ],
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y)
                ]
            ),


          ],
        ),
      ),
    );
  }
}

String getBackImage( var data){
  String backimage=" ";
  switch(data){
    case "Clouds": {backimage="Image/cloudBack.png";}
    break;
    case "Rain": {backimage="Image/rainyBack.jpg";}
    break;
    case "Clear": {backimage="Image/clearBack.jpg";}
    break;
    case "Snow": {backimage="Image/snowBack.jpg";}
    break;
    case "Mist": {backimage="Image/fogyBack.jpg";}
    break;

  }
  return backimage;
}
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}