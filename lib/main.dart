import 'package:firstapp/Login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

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
          color: Colors.amber[50],
          child:Center(

            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(210),
                  ),
                  child: Image.asset('assets/plantCover.jpg',),
                ),
                Padding(padding:EdgeInsets.all(18)),
                Text("fresh your plants",style: TextStyle(fontSize: 40,fontWeight:FontWeight.w400,fontFamily:'Dancing'),),
                Padding(padding: EdgeInsets.all(13)),
                Text("Water your plants smartly while you are at home",textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,fontFamily: 'Courgette'),),
                Padding(padding:EdgeInsets.all(13)),
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
