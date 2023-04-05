import 'package:flutter/material.dart';
class notificationpage extends StatelessWidget {
  const notificationpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: notification(),
      ),
    );
  }
}

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
   return Center(
     child: Column(children: [
       Text("Notifiactio"),

     ],),
   );
  }
}

