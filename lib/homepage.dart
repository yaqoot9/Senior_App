import 'package:firstapp/Details.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firstapp/Widegts/widegts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  late Color pumpColor1=Colors.white;
  late Color pumpColor2=Colors.white;
  late Color pumpColor3=Colors.white;
  late bool isPump1on=false;
  late bool isPump2on=false;
  late bool isPump3on=false;

  Widget build(BuildContext context) {
    fetchLastDataColor1(2135841,'7SYVVV6AFB6OP1KG');
    fetchLastDataColor2(2135843,'UC6JISI0UASBNZ9T');
    fetchLastDataColor3( 2135844,'LIFRJCH2UKWR1PYD');
    fetchPumpStatus(2135844,'LIFRJCH2UKWR1PYD',isPump3on);
    fetchPumpStatus(2135844,'UC6JISI0UASBNZ9T',isPump2on);
    fetchPumpStatus(2135844,'7SYVVV6AFB6OP1KG',isPump1on);
    return Container(
      color:Colors.green[50],
      child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(
          height: 18,
        ),


        Text("  My pumps",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 23,color: Colors.black,fontFamily: 'Courgette'),textAlign: TextAlign.left,),
        SizedBox(height: 5,),
        CarouselSlider(
          items: [
            //first item
            SpecificsCard( pump_color: pumpColor1,pump_name: 'First Pump',img:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp_PQadkXnLpAdwfvCRqHNfvddN05dlj1sBZdaV0_0iTuVvMKTyFJrppyyymvHbvIZUCg&usqp=CAU' ,chanellIdDHt1: 2132322,ReadApiDHt:'8HWE9I4YWWDAP904',chanellIdMoisture1:2135841,ReadApiMoisture:'7SYVVV6AFB6OP1KG',id:1,isPumpOn: isPump1on,),
            //second item
           SpecificsCard( pump_color:pumpColor2,pump_name: 'Second Pump',img:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp_PQadkXnLpAdwfvCRqHNfvddN05dlj1sBZdaV0_0iTuVvMKTyFJrppyyymvHbvIZUCg&usqp=CAU',chanellIdDHt1:2135825,ReadApiDHt:'6L6DZVCJMKHUKZCL',chanellIdMoisture1:2135843,ReadApiMoisture:'UC6JISI0UASBNZ9T',id:2,isPumpOn: isPump2on,),
            //third item
            SpecificsCard( pump_color:pumpColor3,pump_name: 'Third Pump',img:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp_PQadkXnLpAdwfvCRqHNfvddN05dlj1sBZdaV0_0iTuVvMKTyFJrppyyymvHbvIZUCg&usqp=CAU',chanellIdDHt1:2135828,ReadApiDHt:'KU3W1EOT0ZF38X8J',chanellIdMoisture1:2135844,ReadApiMoisture:'LIFRJCH2UKWR1PYD',id:3,isPumpOn: isPump3on,)

          ],

          //Slider Container properties
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.easeInSine,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 730),
            viewportFraction: 0.8,
          ),
        ),
        Text("     _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _",style: TextStyle(color: Colors.grey),),

        Stack(children: [
          Transform.scale(
            scale: 1.2,
            child: Image.asset(
            'assets/Farm.jpg',
              width: 350, // original width
              height: 285, // original height
              fit: BoxFit.cover,
            ),
          ),

         Center(child:Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
           Row(mainAxisAlignment:MainAxisAlignment.center,children: [
           GestureDetector(onDoubleTap: (){
             Navigator.push(context,
               MaterialPageRoute(
                   builder: (context) =>detailsPage(chanellIdDHt1:2135828,ReadApiDHt:'KU3W1EOT0ZF38X8J',chanellIdMoisture1:2135844,ReadApiMoisture:'LIFRJCH2UKWR1PYD',id:3)),);},
               child:   Container(
                 width: MediaQuery.of(context).size.width * 0.4, // Set the desired width here
                 child:  Image.asset('assets/WaterPump1.png'),
               )
           ),
           Container(color:Colors.lime[50],child:Text("Third pump",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),))
         ],),

             Row(mainAxisAlignment:MainAxisAlignment.center,children: [
               GestureDetector(onDoubleTap: (){
                 Navigator.push(context,
                   MaterialPageRoute(
                       builder: (context) =>detailsPage(chanellIdDHt1:2135825,ReadApiDHt:'6L6DZVCJMKHUKZCL',chanellIdMoisture1:2135843,ReadApiMoisture:'UC6JISI0UASBNZ9T',id:2)),);},
                   child:   Container(
                     width: MediaQuery.of(context).size.width * 0.4, // Set the desired width here
                     child:  Image.asset('assets/WaterPump1.png'),
                   )
               ),
               Container(color:Colors.lime[50],child:Text("Second pump",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),))
             ],),


             Row(mainAxisAlignment:MainAxisAlignment.center,children: [
               GestureDetector(onDoubleTap: (){
                 Navigator.push(context,
                 MaterialPageRoute(
                 builder: (context) =>detailsPage(chanellIdDHt1: 2132322,ReadApiDHt:'8HWE9I4YWWDAP904',chanellIdMoisture1:2135841,ReadApiMoisture:'7SYVVV6AFB6OP1KG',id:1)),);},
                   child:   Container(
                     width: MediaQuery.of(context).size.width * 0.4, // Set the desired width here
                     child:  Image.asset('assets/WaterPump1.png'),
                   )
               ),
               Container(color:Colors.lime[50],child:Text("First pump",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),))
              ],)

           ],))

        ],)

      ],
    ),);

  }



  Future<dynamic> fetchLastDataColor1(int chanelId,String readAPI) async {
    final response = await http.get(Uri.parse(
        'https://api.thingspeak.com/channels/${chanelId}/fields/1/last.json?api_key=${readAPI}&results=1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print("${data['field1']}");
if(data['field1'].compareTo("500")>0)
  pumpColor1=Colors.green;
else
  pumpColor1=Colors.red;
print("pump color is:${pumpColor1}");
      return data['field1'];
    } else {
      throw Exception('Failed to load data');
    }
  }



  Future<dynamic> fetchLastDataColor2(int chanelId,String readAPI) async {
    final response = await http.get(Uri.parse(
        'https://api.thingspeak.com/channels/${chanelId}/fields/1/last.json?api_key=${readAPI}&results=1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print("${data['field1']}");
      if(data['field1'].compareTo("500")>0)
        pumpColor2=Colors.green;
      else
        pumpColor2=Colors.red;
      print("pump color is:${pumpColor2}");
      return data['field1'];
    } else {
      throw Exception('Failed to load data');
    }
  }


  Future<dynamic> fetchLastDataColor3(int chanelId,String readAPI) async {
    final response = await http.get(Uri.parse(
        'https://api.thingspeak.com/channels/${chanelId}/fields/1/last.json?api_key=${readAPI}&results=1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print("${data['field1']}");
      if(data['field1'].compareTo("500")>0)
        pumpColor3=Colors.green;
      else
        pumpColor3=Colors.red;
      print("pump color is:${pumpColor3}");
      return data['field1'];
    } else {
      throw Exception('Failed to load data');
    }
  }


  Future<bool> fetchPumpStatus(int chanelId,String readAPI,bool isPumpon) async {
    final response = await http.get(Uri.parse('https://api.thingspeak.com/channels/${chanelId}/fields/2/last.json?api_key=${readAPI}&results=1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final pumpStatus = data['field2'];
      print("PumpStatus${pumpStatus}");
      isPumpon= pumpStatus == '1';
      return pumpStatus == '1';
    } else {
      throw Exception('Failed to fetch pump status');
    }
  }
}

/*  @override
  void initState() {
    super.initState();
    fetchPumpStatus().then((status) {
      setState(() {
        isPumpOn = status;
      });
    }).catchError((error) {
      print('Error fetching pump status: $error');
    });
  }*/

