import 'package:flutter/material.dart';
import 'package:weatherapp/Weather%20Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cityCont =TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

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
              child:ElevatedButton(onPressed: (){
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
