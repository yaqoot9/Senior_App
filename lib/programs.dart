
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
  List<Map> irregationTable = [
    {
      'id': 1,
      'days': '[Sun,Mon]',
      'duration': '25',
      'date':'11:22'
    },
    {
      'id':2,
      'days': '[Sun,Mon]',
      'duration': '15',
      'date':'12:45'
    },
    {
      'id': 3,
      'days': '[Sun,Mon]',
      'duration': '34',
      'date':'13:00'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return
      ListView(
        children: [
          Text("  You can see your irrigation programs for all pumps", style: TextStyle(fontSize: 16),),
          SizedBox(height: 40,),
          _createDataTable(),
          Image.network("https://th.bing.com/th/id/OIP.gckj7F-Xl-jovu6iI24cMwHaHa?pid=ImgDet&rs=1"),

        ],
      );



  }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows(),);
  }
  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Days')),
      DataColumn(label: Text('Duration')),
      DataColumn(label: Text('Time')),

    ];
  }
  List<DataRow> _createRows() {
    return irregationTable
        .map((irregate) => DataRow(cells: [
      DataCell(Text('#' + irregate['id'].toString())),
      DataCell(Text(irregate['days'])),
      DataCell(Text(irregate['duration'])),
      DataCell(Text(irregate['date'])),
    ]))
        .toList();
  }

}

