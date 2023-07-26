import 'package:firstapp/Widegts/widegts.dart';
import 'package:firstapp/addProgram.dart';
import 'package:firstapp/editProgram.dart';
import 'package:firstapp/notification.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class detailsPage extends StatelessWidget {
  late int chanellIdDHt1;
  late int chanellIdMoisture1;
  late String ReadApiDHt;
  late String ReadApiMoisture;
  int SelectedIndex = 0;
  late int id;


  detailsPage(
      {required this.chanellIdDHt1, required this.chanellIdMoisture1, required this.ReadApiMoisture, required this.ReadApiDHt,required this.id});

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[add(id:id),editProgram(id:id), ];
    return MaterialApp(routes: <String, WidgetBuilder>{
      '/addProgram': (BuildContext context) => add(id:id,),
      '/EditProgram': (BuildContext context) => editProgram(id:id),
      '/NotificationPage': (BuildContext context) => notificationpage(),
    },
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              elevation: 80,
              backgroundColor: Colors.lime[50],
              iconSize: 27,
              selectedItemColor: Colors.green,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Add Programm',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.edit),
                  label: 'Edit Programm',
                ),
              ],
      onTap: (int index) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _widgetOptions.elementAt(index),
          ),
        );
      },

            ),
            appBar: AppBar(
              actions: [
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                        icon: const Icon(
                          Icons.notifications, color: Colors.green, size: 35,),
                        tooltip: 'Open notification',
                        onPressed: () {
                          Navigator.pushNamed(context, '/NotificationPage',);
                        }
                    );
                  },
                ),

              ],
              backgroundColor: Colors.lime[50],
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.green, size: 35),
                onPressed: () => Navigator.of(context).pop(),
              ),
              leadingWidth: 105,
              title:
              Text("fresh your plant", style: TextStyle(color: Colors.black,
                  fontSize: 23,
                  fontFamily: 'Courgette',
                  fontWeight: FontWeight.w500),),
              centerTitle: true,),

            body: details(chanellIdDHt1: chanellIdDHt1,
                chanellIdMoisture1: chanellIdMoisture1,
                ReadApiDHt: ReadApiDHt,
                ReadApiMoisture: ReadApiMoisture),
          ),)
    );
  }

}
class details extends StatefulWidget {

   late int chanellIdDHt1;
   late int chanellIdMoisture1;
   late String ReadApiDHt;
   late String ReadApiMoisture;
  details ({required this.chanellIdDHt1,required this.chanellIdMoisture1,required this.ReadApiMoisture,required this.ReadApiDHt});
  @override
  State<details> createState() => _detailsState(ChanellId: chanellIdDHt1,chanellIdMoisture1:chanellIdMoisture1, ReadApiDHt: ReadApiDHt,ReadApiMoisture:ReadApiMoisture);

}

class _detailsState extends State<details> {

  late int ChanellId;
  late int chanellIdMoisture1;
  late String ReadApiDHt;
  late String ReadApiMoisture;
  _detailsState({required this.ChanellId,required this.chanellIdMoisture1,required this.ReadApiMoisture,required this.ReadApiDHt});
   double tempValue=0.0;
   double HumidityValue=0.0;
   double moistureValue=0.0;



  @override
  void initState() {
    super.initState();
    FeacthLastDataTempruter(ChanellId,ReadApiDHt);
    FeacthLastDataHumidity(ChanellId,ReadApiDHt);
    FeacthLastDataMoisture(chanellIdMoisture1,ReadApiMoisture);
    print("Temp:${tempValue}");
    print("Humidity:${HumidityValue}");
    print("Moisture:${moistureValue}");

  }

  Widget build(BuildContext context) {

   return Container(color:Colors.blueGrey[50],child:Stack(

     children: [
       Container(child:Image.asset('assets/Cover.jpg',  opacity: AlwaysStoppedAnimation(0.65),fit: BoxFit.cover)),
       Center(

         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             SizedBox(height: 30,),
             Card(
                 color: Colors.lime[50],
                 elevation: 100,child:
             Column(children: [
               SizedBox(height: 20),
               Text("    Soil Moisture Sensor   ",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 16),),
               SizedBox(height: 20,),
               CircularPercentIndicator(
                 radius: 60.0,
                 lineWidth: 10.0,
                 percent: (100 - (moistureValue / 10.23)) / 100,
                 center: Text(
                   "${(100 - (moistureValue / 10.23)).toStringAsFixed(2)}%",
                   style: TextStyle(fontSize: 23),
                 ),
                 progressColor: Colors.green,
               ),
               SizedBox(height: 10),
               Text("Soil Moisture Value : ${moistureValue}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 14),),
               SizedBox(height: 17),
             ],
             )
             ),
             SizedBox(height: 7),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Card(
                     color: Colors.lime[50],
                     elevation: 20,child:
                 Column(children: [
                   SizedBox(height: 20),
                   Text("    Humidity Sensor   ",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 16),),
                   SizedBox(height: 20,),
                   CircularPercentIndicator(
                     radius: 60.0,
                     lineWidth: 10.0,
                     percent:HumidityValue / 100,
                     center: Text(
                       "${HumidityValue}%",
                       style: TextStyle(fontSize: 23),
                     ),
                     progressColor: Colors.blue,
                   ),
                   SizedBox(height: 10),
                   Text("Humidity Value : ${HumidityValue}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 14),),
                   SizedBox(height: 17)
                 ],
                 )
                 ),
                 Card(
                     color: Colors.lime[50],
                     elevation: 20,child:
                 Column(children: [
                   SizedBox(height: 20),
                   Text("    Tempretuer Sensor   ",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 16),),
                   SizedBox(height: 20,),

                   CircularPercentIndicator(
                     radius: 60.0,
                     lineWidth: 10.0,
                     percent: (tempValue / 0.5) / 100,
                     center: Text(
                       "${tempValue / 0.5}%",
                       style: TextStyle(fontSize: 23),
                     ),
                     progressColor: Colors.red,
                   ),
                   SizedBox(height: 10),
                   Text("Tempretuer Value :${tempValue}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 14),),
                   SizedBox(height: 17)
                 ],
                 )
                 ),
               ],
             ),


            // SizedBox(height: 115,),

            //Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
              // Container(color: Colors.green[200],height: 40,child: TextButton(onPressed: () =>Navigator.pushNamed(context,'/addProgram',), child: Text('Add pump program',style: TextStyle(color: Colors.black87))),),
               //Container(
                 //color: Colors.green[200],height: 40,
                 //child:TextButton(onPressed:()=>Navigator.pushNamed(context,'/EditProgram',), child: Text('Edit pump program ',style: TextStyle(color:Colors.black87),)),
               //)
             //],)
           ],),
       )
     ],) ,);


  }

  Future<dynamic> FeacthLastDataTempruter(int chanelId, String API) async {
    final response = await http.get(Uri.parse(
      'https://api.thingspeak.com/channels/${chanelId}/fields/1/last.json?api_key=${API}&results=1',
    ));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        tempValue = double.parse(data['field1']);
      });
      return data['field1'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> FeacthLastDataHumidity(int chanelId, String API) async {
    final response = await http.get(Uri.parse(
      'https://api.thingspeak.com/channels/${chanelId}/fields/2/last.json?api_key=${API}&results=1',
    ));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        HumidityValue = double.parse(data['field2']);
      });
      return data['field2'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> FeacthLastDataMoisture(int chanelId, String API) async {
    final response = await http.get(Uri.parse(
      'https://api.thingspeak.com/channels/${chanelId}/fields/1/last.json?api_key=${API}&results=1',
    ));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        moistureValue = double.parse(data['field1']);
      });
      return data['field2'];
    } else {
      throw Exception('Failed to load data');
    }
  }


}

