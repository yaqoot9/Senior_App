import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:SafeArea(child:

    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime[50],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green, size: 35),
          onPressed: () => Navigator.of(context).pop(),
        ),
        leadingWidth: 105,
        title:
        Text("fresh your plant", style: TextStyle(color: Colors.black,
            fontSize: 23,
            fontFamily: 'Courgette',
            fontWeight: FontWeight.w500),),
        centerTitle: true,),
      body:help() ,
    )

    ));
  }
}



class help extends StatefulWidget {
  const help({Key? key}) : super(key: key);

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {
    return Container(color:Colors.lime);
  }
}
