
















import 'package:firebase_database/firebase_database.dart';
import 'package:firstapp/editProgram.dart';
import 'package:flutter/material.dart';


class programmsPage extends StatelessWidget {
  const programmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body:Myprogram() ,    ),

    );
  }
}

class Myprogram extends StatefulWidget {
  const Myprogram({Key? key}) : super(key: key);
  @override
  State<Myprogram> createState() => _MyprogramState();
}

class _MyprogramState extends State<Myprogram> {
  late String time1 = "";
  late String speed1 = "";
  late String duration1 = "";
  late String days1 = "";

  late String time2 = "";
  late String speed2 = "";
  late String duration2 = "";
  late String days2 = "";

  late String time3 = "";
  late String speed3 = "";
  late String duration3 = "";
  late String days3 = "";

  late List<Map> irregationTable = [];


  @override
  void initState() {
    super.initState();
    final DatabaseReference dbref1 =
    FirebaseDatabase.instance.ref().child("Schedule/${1}");
    dbref1.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic data1 = dataSnapshot.value;


      setState(() {
        time1 = data1['time'] ?? "";
        speed1 = data1['speed'] ?? "";
        duration1 = data1['duration'] ?? "";

        days1 = data1['days'] ?? "";
      });
      irregationTable.add(   {
        'id': 1,
        'days': days1,
        'duration':duration1,
        'time': time1,

      });

    });


    final DatabaseReference dbref2 =
    FirebaseDatabase.instance.ref().child("Schedule/${2}");
    dbref2.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;

      dynamic data2 = dataSnapshot.value;

      setState(() {
        time2 = data2['time'] ?? "";
        speed2 = data2['speed'] ?? "";
        duration2 = data2['duration'] ?? "";
        days2 = data2['days'] ?? "";
      });


      irregationTable.add(       {
        'id': 2,
        'days': days2,
        'duration': duration2,
        'time': time2,
      }
      );
    });


    final DatabaseReference dbref3 =
    FirebaseDatabase.instance.ref().child("Schedule/${3}");
    dbref3.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic data3 = dataSnapshot.value;


      setState(() {
        time3 = data3['time'] ?? "";
        speed3 = data3['speed'] ?? "";
        duration3 = data3['duration'] ?? "";
        days3 = data3['days'] ?? "";
      });

      irregationTable.add({
        'id': 3,
        'days': days3,
        'duration': duration3,
        'time': time3,
      }
      );
      });

  }

  Widget build(BuildContext context) {
    return Container(
      //color:Colors.lime[50],
        child:ListView(
      children: [
        Container(width:8,height: 50,color: Colors.white24, child: Center(child:Text(
          "  Irrigation programs for pumps ",
          style: TextStyle(fontSize: 19,fontFamily: 'Courgette'),
        ),) ),

        SizedBox(height: 20),
        _createDataTable(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/Paper-removebg-preview.png',
              width: 303, // Adjust the width of the image as per your requirement
            ),
          ],
        ),

      ],
    )
    );
  }

  Widget _createDataTable() {
    return DataTable(
      dataRowHeight: 70 ,
      columnSpacing: 7,
      dividerThickness:
      3.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0, // Adjust the thickness of the border as per your requirement
        ),
      ),


      columns: [
        DataColumn(label: Center(child:Text('Pump#'))),
        DataColumn(label:Center(child:Text('Days',)) ),
        DataColumn(label: Center(child:Text('Duration'))),
        DataColumn(label: Center(child:Text('Time',))),
        DataColumn(label: Center(child:Text('Edit',))),
      ],
      rows: irregationTable.map((data) {
        return DataRow(
          cells: [
            DataCell(Text(data['id'].toString(),style: TextStyle(fontFamily: 'Courgette'),)),
            DataCell(Text(data['days'],style: TextStyle(fontSize: 18,fontFamily: 'Courgette'),)),
            DataCell(Text(data['duration'],style: TextStyle(fontFamily: 'Courgette'))),
            DataCell(Text(data['time'],style: TextStyle(fontFamily: 'Courgette'))),
            DataCell(Container(width: 30,height: 30,color: Colors.lightGreen[200],child:TextButton(  onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => editProgram(id: data['id'])),
              );
        },child:Center(child:Icon(Icons.edit_sharp,size: 19,color:Colors.black),)))),
          ],
        );

      }
      ).toList(),
    );
  }
}