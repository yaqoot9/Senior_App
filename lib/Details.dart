import 'package:firstapp/addProgram.dart';
import 'package:firstapp/notification.dart';
import 'package:firstapp/programs.dart';
import 'package:flutter/material.dart';
class detailsPage extends StatelessWidget {
  const detailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  routes: <String, WidgetBuilder>{
      '/addProgram':(BuildContext context) =>add(),
      '/EditProgram':(BuildContext context)=>programmsPage(),
      '/NotificationPage':(BuildContext context)=>notificationpage(),
    },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar:  AppBar(
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                  icon: const Icon(Icons.notifications,color:Colors.black,size: 35,),
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
              icon: const Icon(Icons.arrow_back,color:Colors.black,size: 35,),
              onPressed: () { Navigator.pop;}
            );
          },
        ),
          leadingWidth: 105,
          title:
          Text("fresh your plant",style: TextStyle(color: Colors.black,fontSize: 18),),
          centerTitle: true,),

        body: details(),
      ),
    );
  }
}
class details extends StatefulWidget {
  const details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
   return Center(

     child: Column(
       children: [
         //SizedBox(height: 20,),
       Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
         Container(color: Colors.lime[200],height: 30,child: TextButton(onPressed: () =>Navigator.pushNamed(context,'/addProgram',), child: Text('Add pump program',style: TextStyle(color: Colors.black87))),),
         Container(
           color: Colors.lime[200],height: 30,
           child:TextButton(onPressed:()=>Navigator.pushNamed(context,'/EditProgram',), child: Text('Edit pump program ',style: TextStyle(color: Colors.black87),)),
         )
       ],)
     ],),
   );
  }
}

