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
  Color pumpColor1=Colors.black87;
  Color pumpColor2=Colors.green;
  Color pumpColor3=Colors.green;


  Widget build(BuildContext context) {
    fetchLastData(2132322);
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
            SpecificsCard( pump_color: pumpColor1,pump_name: 'First Pump',img:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp_PQadkXnLpAdwfvCRqHNfvddN05dlj1sBZdaV0_0iTuVvMKTyFJrppyyymvHbvIZUCg&usqp=CAU' ,),
            //second item
            SpecificsCard( pump_color: Colors.green,pump_name: 'Second Pump',img:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp_PQadkXnLpAdwfvCRqHNfvddN05dlj1sBZdaV0_0iTuVvMKTyFJrppyyymvHbvIZUCg&usqp=CAU'),
            //third item
            SpecificsCard( pump_color: Colors.red,pump_name: 'Third Pump',img:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp_PQadkXnLpAdwfvCRqHNfvddN05dlj1sBZdaV0_0iTuVvMKTyFJrppyyymvHbvIZUCg&usqp=CAU')

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



  Future<dynamic> fetchLastData(int chanelId) async {
    final response = await http.get(Uri.parse(
        'https://api.thingspeak.com/channels/${chanelId}/fields/2/last.json?api_key=8HWE9I4YWWDAP904&results=1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data['field2']);
if(data['field2'].compareTo("10")>0)
        pumpColor1=Colors.black87;

      return data['field2'];
    } else {
      throw Exception('Failed to load data');
    }
  }

}
