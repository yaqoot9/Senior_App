import 'package:flutter/material.dart';
class notificationpage extends StatelessWidget {
  const notificationpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  List<String> _values = [];
  @override
  Widget build(BuildContext context) {
    if (_values==[]){
      return Text("No notification!");
    }
   return Center(

     child: Column(children: [
       SizedBox(height: 25,),
       Text("Notifiaction",style:TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.amber[600])),
     SizedBox(height: 10,),
     SizedBox(height: 500,
   child:ListView.separated(
   separatorBuilder: (context, index) => Divider(
   color: Colors.black,
   ),
   itemCount: _values.length,
   padding: const EdgeInsets.all(5.0),
   itemBuilder: (context, index) {
   return Dismissible(
   key: Key('item ${_values[index]}'),
   background: Container(
   color: Colors.red,
   child: Padding(
   padding: const EdgeInsets.all(15),
   child: Row(
   children: <Widget>[
   Icon(Icons.delete, color: Colors.white),
   Text('Move to trash', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400)),
   ],
   ),
   ),
   ),

   confirmDismiss: (DismissDirection direction) async {
   return await showDialog(
   context: context,
   builder: (BuildContext context) {
   return AlertDialog(
   title:Text("Delete Confirmation"),
   content: Text("Are you sure you want to delete this notification?"),
   actions: <Widget>[
   TextButton(
   onPressed: () => Navigator.of(context).pop(true),
   child: const Text("Delete")
   ),
   TextButton(
   onPressed: () => Navigator.of(context).pop(false),
   child: const Text("Cancel"),
   ),
   ],
   );
   },
   );
   },
   onDismissed: (DismissDirection direction) {
   if (direction == DismissDirection.startToEnd) {
   print("Remove item");
   }

   setState(() {
   _values.removeAt(index);
   });
   },
   child: ListTile(
   leading: Icon(Icons.notifications_active_outlined, size: 30,color: Colors.amber[600],),
   title: Text(_values[index],style: TextStyle(fontSize:17,fontWeight: FontWeight.w500)),

   ),
   );
   }
   ),
   ),
     ],),
   );
  }
}

