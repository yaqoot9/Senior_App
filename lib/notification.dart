import 'package:firstapp/home.dart';
import 'package:flutter/material.dart';
class notificationpage extends StatelessWidget {
  const notificationpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/HomePage':(BuildContext context) =>Home (),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(
          actions: [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                    icon: const Icon(Icons.home,color:Color(0xFF7CB342),size: 35,),
                    onPressed: () {Navigator.pushNamed(context,'/HomePage',);
                    }
                );
              },
            ),

          ],
          backgroundColor: Colors.lime[100],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF7CB342),size: 35),
            onPressed: () => Navigator.of(context).pop(),
          ),
          leadingWidth: 105,
          title:
          Text("fresh your plant",style: TextStyle(color: Colors.black,fontSize: 18),),

          centerTitle: true,),
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
  List<String> _values = ['Pump 1 open on 2:00','Moisture level on 3:00 is below threshold','Pump 2 open on 3:55','Moisture level on 3:00 is below threshold','Pump 1 open on 2:00'];
  @override
  Widget build(BuildContext context) {

   return Center(

     child: Column(children: [
       //SizedBox(height: 30,),
       //Text("Notifiaction",style:TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Color(0xFF7CB342))),
     SizedBox(height: 10,),
     SizedBox(height: 300,
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
   leading: Icon(Icons.notifications_active_outlined, size: 30,color: Color(0xFF7CB342),),
   title: Text(_values[index],style: TextStyle(fontSize:17,fontWeight: FontWeight.w500)),

   ),
   );
   }
   ),
   ),
     ],),
   );}
  }


