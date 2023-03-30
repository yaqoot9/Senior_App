import 'package:firstapp/notification.dart';
import 'package:firstapp/widegts.dart';
import'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/NotificationPage':(BuildContext context) =>notificationpage (),
      },
      debugShowCheckedModeBanner: false,
     home: Scaffold(
       appBar:AppBar(
         actions: [
           Builder(
             builder: (BuildContext context) {
             return IconButton(
                   icon: const Icon(Icons.notifications,color: Colors.black54,size: 35,),
                   tooltip: 'Open notification',
                   onPressed: () {Navigator.pushNamed(context,'/NotificationPage',);
                   }
               );
             },
           ),

         ],
         backgroundColor: Colors.lime[100],leading: Builder(
         builder: (BuildContext context) {
           return IconButton(
             icon: const Icon(Icons.account_circle,color: Colors.black54,size: 35,),
             onPressed: () { Scaffold.of(context).openDrawer(); },
             tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
           );
         },
       ),
         leadingWidth: 105,
       title:
         Text("fresh your plant",style: TextStyle(color: Colors.black54,fontSize: 18),),

       centerTitle: true,),

       body: HomePage(),
     ),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 5,
      ),
      TextField(
        //onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
            labelText: 'Search', suffixIcon: Icon(Icons.search)),
      ),
      const SizedBox(
        height: 5,
      ),
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
          height: 170.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.easeInSine,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 730),
          viewportFraction: 0.8,
        ),
      ),

    ],);
  }
}

