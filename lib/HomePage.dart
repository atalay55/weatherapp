import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/Weather%20Page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cityCont =TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String lat;
  late String lon;
  late var pageWidth;

  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Weather",style: TextStyle(fontSize: 21))
          ,backgroundColor: Colors.deepPurple) ,
      body: Center(
        child: SingleChildScrollView(
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
                child: Form(
                  key: _formKey,
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
                    validator: (String? value) {
                     if(value==null||value.isEmpty){
                        return " please enter city name";
                     }
                     return null;
                    }
                  ),
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
                      bool isTrue= _formKey.currentState!.validate();
                  setState(() {
                    if(isTrue){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherPage(city: cityCont.text)));
                    }

                  });

                }, child: Text("Get Weather")),
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
                      getCurrentLocation().then((value) {
                        lat="${value.latitude}";
                        lon ="${value.longitude}";
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>WeatherPage.geo(lat: lat.toString(), lon: lon.toString(),withLoc: true,)));
                        });

                      });




                    }, child: Text("Get with Location")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<Position> getCurrentLocation()async{
  bool serviceEnabled=await Geolocator.isLocationServiceEnabled();
  if(!serviceEnabled){ return Future.error("Location services are disabled");}
  LocationPermission permission=await Geolocator.checkPermission();
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  if(permission==LocationPermission.deniedForever){
    return Future.error("Location permission are permanently denied, we cannot request");}
  return await Geolocator.getCurrentPosition();
}
