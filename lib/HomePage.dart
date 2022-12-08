import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weatherapp/Weather%20Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cityCont =TextEditingController();
  late var pageWidth;



  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Weather",style: TextStyle(fontSize: 21))
          ,backgroundColor: Colors.deepPurple) ,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.only(bottom: pageWidth/10),
              child: SizedBox(
                  width: pageWidth/3,
                  height: pageWidth/3,
                  child: Image.asset("Image/mainImage.jpg")),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20,bottom: 25),
              child: TextFormField(
                controller: cityCont,
                decoration: InputDecoration(
                    labelText: "City",
                  errorBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(8.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(8.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 2, color: Colors.black87),
                      borderRadius: BorderRadius.circular(8.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(8.0)), ),
              ),
            ),
            Padding(
              padding:EdgeInsets.only(top: 25.0),
              child:ElevatedButton(
                  style:ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    overlayColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                  ),
                  onPressed: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>WeatherPage(city: cityCont.text)));
                });

              }, child: Text("Get Weather")),
            )
          ],
        ),
      ),
    );
  }
}

