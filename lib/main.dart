import 'package:firstapp/Login.dart';
import 'package:firstapp/Register.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: <String, WidgetBuilder>{
          '/LoginPage': (BuildContext context) =>LoginPage(),

        },
        debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: Container(
          color: Colors.lime[100],
          child:Center(

            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(210),
                  ),
                  child: Image.asset('assets/plantCover.jpg'),
                ),
                Padding(padding:EdgeInsets.all(38)),
                Text("fresh your plants",style: TextStyle(fontSize: 30,fontWeight:FontWeight.w300),),
                Padding(padding: EdgeInsets.all(23)),
                Text("Water your plants smartly while you are at home",textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                Padding(padding:EdgeInsets.all(33)),
              Builder(builder: (context)=>Center(
                child:  TextButton(onPressed: () => Navigator.pushNamed(context,'/LoginPage'),
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.green[900]!),),
                child: Text("lets watering",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500,color: Colors.white)
                ),
              ),))
                  ])
    )

        ),
      )
    );
  }


}
