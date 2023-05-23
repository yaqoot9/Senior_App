import 'dart:convert';
import 'package:firstapp/Details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpecificsCard extends StatefulWidget {

  Color pump_color;
  final String pump_name;
  final String img;
  final int chanellIdDHt1;

  final int chanellIdMoisture1;
  final String ReadApiDHt;
  final String ReadApiMoisture;
  final int id;

  SpecificsCard({required this.pump_color, required this.pump_name, required this.img,required this.chanellIdDHt1,required this.chanellIdMoisture1,required this.ReadApiDHt,required this.ReadApiMoisture,required this.id});
  @override
  _SpecificsCardState createState() => _SpecificsCardState();
}

class _SpecificsCardState extends State<SpecificsCard> {
  bool isPumpOn = true;

  @override
  void initState() {
    super.initState();
    fetchPumpStatus().then((status) {
      setState(() {
        isPumpOn = status;
      });
    }).catchError((error) {
      print('Error fetching pump status: $error');
    });
  }

  Future<bool> fetchPumpStatus() async {
    final response = await http.get(Uri.parse('https://api.thingspeak.com/channels/2135844/feeds.json?api_key=LIFRJCH2UKWR1PYD'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final pumpStatus = data['pumpStatus'];
      return pumpStatus == '1';
    } else {
      throw Exception('Failed to fetch pump status');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 45.0, left: 20, right: 20, top: 8),
          padding: EdgeInsets.only(left: 11, right: 21, top: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0.9,
              color: Colors.brown,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.pump_name,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'Dancing',
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: widget.pump_color,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
        Positioned(
          child: Icon(
            isPumpOn ? Icons.lock_open : Icons.lock,
            size: 35,
          ),
          top: 103,
          left: 25,
        ),
        Positioned(
          top: 65,
          left: 210,
          child: GestureDetector(
            onDoubleTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => detailsPage(
                    chanellIdDHt1: widget.chanellIdDHt1,
                    chanellIdMoisture1: widget.chanellIdMoisture1,
                    ReadApiMoisture: widget.ReadApiMoisture,
                    ReadApiDHt: widget.ReadApiMoisture,
                    id: widget.id,
                  ),
                ),
              );
            },
            child: CircleAvatar(
              radius: 58,
              backgroundImage: NetworkImage(widget.img),
            ),
          ),
        ),
      ],
    );
  }
}