import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firstapp/home.dart';
import 'package:flutter/material.dart';

class notificationpage extends StatelessWidget {
  const notificationpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => Home(),
      },
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: Scaffold(
        appBar: AppBar(
          actions: [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                    icon: const Icon(
                      Icons.home,
                      color: Color(0XFFECEFF1),
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/HomePage',
                      );
                    });
              },
            ),
          ],
          backgroundColor:Colors.cyan[600],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blueGrey[50], size: 35),
            onPressed: () => Navigator.of(context).pop(),
          ),
          leadingWidth: 105,
          title: Text(
              "Water Tank",style: TextStyle(fontSize: 27,fontFamily:'Courgette',color:Colors.white),
          ),
          centerTitle: true,
        ),
        body: notification(),
      ),)
    );
  }
}

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
 late String img='assets/WaterTank-removebg-preview.png';
 late double level=10;

  @override
  void initState() {
    super.initState();
    featchWaterLevel();
  }
  Widget build(BuildContext context) {


    setState(() {
      if (level < 2)
        img = 'assets/WaterTank-removebg-preview.png';
      else if (level < 4)
        img = 'assets/2Level.png';
      else if (level < 6)
        img = 'assets/3Level.png';
      else if (level < 8)
        img = 'assets/4Level.png';
      else
        img = 'assets/5Level.png';
    });
    String formattedLevel = (10 - level).toStringAsFixed(2);
    return Container(color: Colors.blueGrey[50],
    child:Center(
        child:Column
          (mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(img,width:300),
        SizedBox(height:85,),
       // Text("Water tank height is 30 cm ",style: TextStyle(fontSize: 23,fontFamily:'Courgette')),
       Container(padding: EdgeInsets.all(17),decoration: BoxDecoration(
         color: (10 - level) < 3 ? Colors.deepOrange[300] : Colors.white24,
         border: Border.all(
           color: Colors.black,
           width: 3.0,
         ),
       ),child:Text("Water level : $formattedLevel cm",style: TextStyle(fontSize: 23,fontFamily:'Courgette')),)


        ],)
    )) ;
  }
 Future<dynamic> featchWaterLevel() async {
   final response = await http.get(Uri.parse(
       'https://api.thingspeak.com/channels/2162807/fields/1/last.json?api_key=798N0VFXW903UL2K&results=1'));

   if (response.statusCode == 200) {
     final data = json.decode(response.body);
     final waterLevel = double.parse(data['field1']);
     setState(() {
       level = waterLevel;
     });
     print("Water Level in Tank is : $waterLevel");
     return waterLevel;
   } else {
     throw Exception('Failed to fetch pump status');
   }
 }
}



