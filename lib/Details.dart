import 'package:firstapp/addProgram.dart';
import 'package:firstapp/editProgram.dart';
import 'package:firstapp/notification.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class detailsPage extends StatelessWidget {
  const detailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  routes: <String, WidgetBuilder>{
      '/addProgram':(BuildContext context) =>add(),
      '/EditProgram':(BuildContext context)=>editProgram(),
      '/NotificationPage':(BuildContext context)=>notificationpage(),
    },
      debugShowCheckedModeBanner: false,
      home: SafeArea(child:Scaffold(
        appBar:  AppBar(
          actions: [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                    icon: const Icon(Icons.notifications,color:Color(0xFF7CB342),size: 35,),
                    tooltip: 'Open notification',
                    onPressed: () {Navigator.pushNamed(context,'/NotificationPage',);
                    }
                );
              },
            ),

          ],
          backgroundColor: Colors.lime[100],leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF7CB342),size: 35),
          onPressed: () => Navigator.of(context).pop(),
        ),
          leadingWidth: 105,
          title:
          Text("fresh your plant",style: TextStyle(color: Colors.black,fontSize: 18),),
          centerTitle: true,),

        body: details(),
      ),)
    );
  }
}
class details extends StatefulWidget {

  @override
  State<details> createState() => _detailsState();

}

class _detailsState extends State<details> {
   double tempValue=0.0;

  @override
  Widget build(BuildContext context) {
    fetchLastData(2132322);
    print("yaqoota${tempValue}");
   return Stack(

       children: [
         Container(child:Image.asset('assets/Cover.jpg',  opacity: AlwaysStoppedAnimation(0.75),fit: BoxFit.cover)),
         Center(

           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               SizedBox(height: 30,),
               Card(
                   elevation: 20,child:
               Column(children: [
                 SizedBox(height: 20),
                 Text("    Soil Moisture Sensor   ",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 16),),
                 SizedBox(height: 20,),
                 CircularPercentIndicator(
                   radius: 60.0,
                   lineWidth: 10.0,
                   percent: 0.6,
                   center: new Text("60%"),
                   progressColor: Colors.green,
                 ),
                 SizedBox(height: 20),
               ],
               )
               ),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Card(
                       elevation: 20,child:
                   Column(children: [
                     SizedBox(height: 20),
                     Text("    Humidity Sensor   ",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 16),),
                     SizedBox(height: 20,),
                     CircularPercentIndicator(
                       radius: 60.0,
                       lineWidth: 10.0,
                       percent: 0.7,
                       center: new Text("70%"),
                       progressColor: Colors.blue,
                     ),
                     SizedBox(height: 20),
                   ],
                   )
                   ),
                   Card(
                       elevation: 20,child:
                   Column(children: [
                     SizedBox(height: 20),
                     Text("    Tempretuer Sensor   ",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 16),),
                     SizedBox(height: 20,),
                     CircularPercentIndicator(
                       radius: 60.0,
                       lineWidth: 10.0,
                       percent: tempValue/100,
                       center: new Text("40%"),
                       progressColor: Colors.red,
                     ),
                     SizedBox(height: 20),
                   ],
                   )
                   ),
                 ],
               ),


               SizedBox(height: 55,),

               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                 Container(color: Colors.lime[200],height: 40,child: TextButton(onPressed: () =>Navigator.pushNamed(context,'/addProgram',), child: Text('Add pump program',style: TextStyle(color: Colors.black87))),),
                 Container(
                   color: Colors.lime[200],height: 40,
                   child:TextButton(onPressed:()=>Navigator.pushNamed(context,'/EditProgram',), child: Text('Edit pump program ',style: TextStyle(color: Colors.black87),)),
                 )
               ],)
             ],),
         )
       ],);

  }



  Future<dynamic> fetchLastData(int chanelId) async {
    final response = await http.get(Uri.parse(
        'https://api.thingspeak.com/channels/${chanelId}/fields/2/last.json?api_key=8HWE9I4YWWDAP904&results=1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data['field2']);
    tempValue=double.parse(data['field2']) ;

      return data['field2'];
    } else {
      throw Exception('Failed to load data');
    }
  }
}

