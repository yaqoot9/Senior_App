import 'package:firstapp/Details.dart';
import 'package:firstapp/Login.dart';
import 'package:firstapp/homepage.dart';
import 'package:firstapp/notification.dart';
import 'package:firstapp/programs.dart';
import'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/NotificationPage':(BuildContext context) =>notificationpage (),
       // '/DeteilsPage':(BuildContext context)=>detailsPage(ChanellId: ChanellId),
        '/login':(BuildContext context)=>LoginPage(),
        '/myprogram':(BuildContext context)=>programmsPage(),
      },
      debugShowCheckedModeBanner: false,
     home:HomePage()
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index =0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget>screens=[
    homepage(),
    //notificationpage (),
    programmsPage(),

  ];



  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      bottomNavigationBar:CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: index,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, size: 30,color: Colors.green,),
          //Icon(Icons.notifications, size: 30,color: Colors.black),
          Icon(Icons.date_range, size: 30,color: Colors.green),
        ],
        color: Color(0XFFF9FE7),
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            this.index= index;
          });
        },

      ),


      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(decoration: BoxDecoration(),child: Center(
              child: Column(children: [
                CircleAvatar(
                  radius: 40, // Image radius
                  backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.K7lG3005eY-tEHwlxf61qgHaFx?pid=ImgDet&rs=1"),
                ),
                Text("Ahmad Awad",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Text("Ahmad@gmail.com")
              ],),
            ),),

            Builder(builder: (context)=>ListTile(
              leading: Icon(Icons.person),
              title: Text("User information"),
              // onTap:() {Navigator.pushNamed(context,'/NotificationPage');}
            )),

            Builder(builder: (context)=>
                ListTile(
                    leading: Icon(Icons.date_range),
                    title: Text("My programs"),
                    onTap:() {Navigator.pushNamed(context,'/myprogram');}
                )),

            Builder(builder: (context)=>ListTile(
                leading: Icon(Icons.notifications),
                title: Text("Notification"),
                onTap:() {Navigator.pushNamed(context,'/NotificationPage');}
            )),


            Builder(builder: (context)=>ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
              // onTap:() {Navigator.pushNamed(context,'/NotificationPage');}
            ) ) ,

            Builder(builder: (context)=>ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap:() {Navigator.pushNamed(context,'/login');}
            ) ),
          ],
        ),
      ),

      appBar:AppBar(
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                  icon: const Icon(Icons.notifications,color:Colors.green,size: 35,),
                  tooltip: 'Open notification',
                  onPressed: () {Navigator.pushNamed(context,'/NotificationPage',);
                  }
              );
            },
          ),

        ],
        backgroundColor: Colors.lime[50],leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.account_circle,color:Colors.green,size: 35,),
            onPressed: () { Scaffold.of(context).openDrawer(); },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
        leadingWidth: 105,
        title:
        Text("fresh your plant",style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'Dancing'),),

        centerTitle: true,),

      body: screens.elementAt(index),
    ));
  }
}

