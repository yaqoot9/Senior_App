import 'package:flutter/material.dart';

class SpecificsCard extends StatelessWidget {
  Color pump_color;
  final String pump_name;
  final String img;

  SpecificsCard({required this.pump_color, required this.pump_name, required this.img});

  @override
  Widget build(BuildContext context) {
   return Stack(children: [
    Container(

      margin: EdgeInsets.only(bottom: 45.0,left: 20,right: 20,top:8),
        padding: EdgeInsets.only(left: 11,right: 21,top: 5),
      decoration: BoxDecoration(
        color: Colors.lime[100],
        border: Border.all(
          width: 2,),
        borderRadius: BorderRadius.circular(10.0),
      ),

    child:
    Column(children: [
      Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
        Text(pump_name,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(color: pump_color,borderRadius: BorderRadius.circular(50)),
        )
      ],),
      SizedBox(height: 40,)
    ],)
    ),
    Positioned(
    top:45,left: 193,
      child:
    GestureDetector(onDoubleTap: null,
      child: CircleAvatar(
      radius: 60, // Image radius
      backgroundImage: NetworkImage(img),
    )
    ) )



    ],






    );
  }
}