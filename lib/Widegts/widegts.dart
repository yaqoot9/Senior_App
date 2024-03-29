
import 'dart:convert';

import 'package:firstapp/Details.dart';
import 'package:flutter/material.dart';

class SpecificsCard extends StatelessWidget {
  bool isPumpOn;
  final Color pump_color;
  final String pump_name;
  final String img;
  final int chanellIdDHt1;

  final int chanellIdMoisture1;
  final String ReadApiDHt;
  final String ReadApiMoisture;
  final int id;

  SpecificsCard({required this.pump_color, required this.pump_name, required this.img,required this.chanellIdDHt1,required this.chanellIdMoisture1,required this.ReadApiDHt,required this.ReadApiMoisture,required this.id,required this.isPumpOn});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(

          margin: EdgeInsets.only(bottom: 45.0,left: 20,right: 20,top:8),
          padding: EdgeInsets.only(left: 11,right: 21,top: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                width: 0.9,
                color: Colors.brown),
            borderRadius: BorderRadius.circular(10.0),
          ),

          child:
          Column(children: [
            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
              Text(pump_name,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black87,fontFamily: 'Dancing'),),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(color: pump_color,borderRadius: BorderRadius.circular(50)),
              )
            ],),
            SizedBox(height: 40,)
          ],)
      ),
      Positioned(child:Icon(isPumpOn ? Icons.lock_open : Icons.lock,size: 35,),top:103,left: 25, ),

      Positioned(
          top:65,left: 210,
          child:
          GestureDetector(onTap: (){Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>detailsPage(chanellIdDHt1: chanellIdDHt1,chanellIdMoisture1:chanellIdMoisture1,ReadApiMoisture:ReadApiMoisture,ReadApiDHt:ReadApiDHt,id: id,)),

          );},
              child: CircleAvatar(
                radius: 58, // Image radius
                backgroundImage: NetworkImage(img),
              )
          ) )


    ],






    );
  }


}
