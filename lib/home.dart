import 'package:firstapp/notification.dart';
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

          //1st Image of Slider
          Container(
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage('https://th.bing.com/th/id/OIP.avb9nDfw3kq7NOoP0grM4wHaEK?pid=ImgDet&rs=1'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //2nd Image of Slider
          Container(
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage('https://th.bing.com/th/id/OIP.avb9nDfw3kq7NOoP0grM4wHaEK?pid=ImgDet&rs=1'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //3rd Image of Slider
          Container(
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage('https://th.bing.com/th/id/OIP.avb9nDfw3kq7NOoP0grM4wHaEK?pid=ImgDet&rs=1'),
                fit: BoxFit.cover,
              ),
            ),
          ),

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

