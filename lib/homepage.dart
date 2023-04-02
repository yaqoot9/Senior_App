import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firstapp/Widegts/widegts.dart';
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8,
        ),

        TextField(
          //onChanged: (value) => _runFilter(value),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Search', suffixIcon: Icon(Icons.search)),
        ),
        const SizedBox(
          height: 12,
        ),
        Text("  My pumps",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 23,color: Colors.black),textAlign: TextAlign.left,),
        SizedBox(height: 5,),
        CarouselSlider(
          items: [
            //first item
            SpecificsCard( pump_color: Colors.red,pump_name: 'First Pump',img:'https://th.bing.com/th/id/R.166c0ac31bf882dd621aeb1b996a677b?rik=5Ozv3loNIkqqAw&pid=ImgRaw&r=0' ,),
            //second item
            SpecificsCard( pump_color: Colors.green,pump_name: 'Second Pump',img:'https://th.bing.com/th/id/R.7af6ae3e44c15c54cdb64c87c54618cf?rik=nLdhmLD5MmoC7Q&pid=ImgRaw&r=0'),
            //third item
            SpecificsCard( pump_color: Colors.red,pump_name: 'Third Pump',img:'https://th.bing.com/th/id/R.35b6035b41dbeeaa2181d1729b3451a6?rik=7MV8WP9x5qE3oA&pid=ImgRaw&r=0')

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
        SizedBox(height: 6,),
        Text("     _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _",style: TextStyle(color: Colors.grey),),
        SizedBox(height: 5,),
        Text("   Notification",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700,color: Colors.black),),
        SizedBox(height: 5,),
        Container(margin: EdgeInsets.only(left:5),color:Colors.lightGreen[100],
        width: 370,
        height: 75,
        child: Text("jjj"),)
      ],);
  }
}
