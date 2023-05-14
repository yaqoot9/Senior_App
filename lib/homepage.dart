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


  Widget build(BuildContext context) {
    fetchLastDataColor1(2135841,'7SYVVV6AFB6OP1KG');
    fetchLastDataColor2(2135843,'UC6JISI0UASBNZ9T');
   // fetchLastDataColor3( 2135844,'LIFRJCH2UKWR1PYD');
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
            SpecificsCard( pump_color: pumpColor1,pump_name: 'First Pump',img:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp_PQadkXnLpAdwfvCRqHNfvddN05dlj1sBZdaV0_0iTuVvMKTyFJrppyyymvHbvIZUCg&usqp=CAU' ,chanellIdDHt1: 2132322,ReadApiDHt:'8HWE9I4YWWDAP904',chanellIdMoisture1:2135841,ReadApiMoisture:'7SYVVV6AFB6OP1KG',id:1),
            //second item
           SpecificsCard( pump_color:pumpColor2,pump_name: 'Second Pump',img:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp_PQadkXnLpAdwfvCRqHNfvddN05dlj1sBZdaV0_0iTuVvMKTyFJrppyyymvHbvIZUCg&usqp=CAU',chanellIdDHt1:2135825,ReadApiDHt:'6L6DZVCJMKHUKZCL',chanellIdMoisture1:2135843,ReadApiMoisture:'UC6JISI0UASBNZ9T',id:2),
            //third item
            SpecificsCard( pump_color:pumpColor3,pump_name: 'Third Pump',img:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp_PQadkXnLpAdwfvCRqHNfvddN05dlj1sBZdaV0_0iTuVvMKTyFJrppyyymvHbvIZUCg&usqp=CAU',chanellIdDHt1:2135828,ReadApiDHt:'KU3W1EOT0ZF38X8J',chanellIdMoisture1:2135844,ReadApiMoisture:'LIFRJCH2UKWR1PYD',id:3)

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
        SizedBox(height: 5,),
        Text("     _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _",style: TextStyle(color: Colors.grey),),
        SizedBox(height: 5,),
        Text("   Notification",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700,color: Colors.black),),
        SizedBox(height: 15,),
        Container(margin: EdgeInsets.only(left:5),color:Colors.lightGreen[200],
          width: 375,
          height: 55,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Pump 3 open at 3:45',style:TextStyle(fontWeight: FontWeight.w500,fontSize: 16),
            ),
          ),),
        SizedBox(height: 8,),
        Container(margin: EdgeInsets.only(left:5),color:Colors.lightGreen[200],
          width: 375,
          height: 55,
          child:Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Moisture level on 3:00 is below threshold', style:TextStyle(fontWeight: FontWeight.w500,fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ),),
        SizedBox(height: 8,),
        Container(margin: EdgeInsets.only(left:5),color:Colors.lightGreen[200],
          width: 375,
          height: 55,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Pump 1 close at 5:15',style:TextStyle(fontWeight: FontWeight.w500,fontSize: 16),
            ),
          ),),

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


}
