import 'dart:convert';

import 'package:day_picker/day_picker.dart';
import 'package:dialogs/dialogs.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firstapp/Details.dart';
import 'package:firstapp/Login.dart';
import 'package:firstapp/home.dart';
import 'package:firstapp/programs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class editProgram extends StatelessWidget {
  int id;
  editProgram({required this.id});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: <String, WidgetBuilder>{
          '/HomePage': (BuildContext context) => Home(),
          //'/DeteilsPage':(BuildContext context)=>detailsPage(),
          '/login': (BuildContext context) => LoginPage(),
          '/myprogram': (BuildContext context) => programmsPage(),
        },
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(),
                    child: Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40, // Image radius
                            backgroundImage: NetworkImage(
                                "https://th.bing.com/th/id/OIP.K7lG3005eY-tEHwlxf61qgHaFx?pid=ImgDet&rs=1"),
                          ),
                          Text(
                            "Ahmad Awad",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text("Ahmad@gmail.com")
                        ],
                      ),
                    ),
                  ),
                  Builder(
                      builder: (context) => ListTile(
                            leading: Icon(Icons.person),
                            title: Text("User information"),
                            // onTap:() {Navigator.pushNamed(context,'/NotificationPage');}
                          )),
                  Builder(
                      builder: (context) => ListTile(
                          leading: Icon(Icons.date_range),
                          title: Text("My programs"),
                          onTap: () {
                            Navigator.pushNamed(context, '/myprogram');
                          })),
                  Builder(
                      builder: (context) => ListTile(
                          leading: Icon(Icons.notifications),
                          title: Text("Notification"),
                          onTap: () {
                            Navigator.pushNamed(context, '/NotificationPage');
                          })),
                  Builder(
                      builder: (context) => ListTile(
                            leading: Icon(Icons.help),
                            title: Text("Help"),
                            // onTap:() {Navigator.pushNamed(context,'/NotificationPage');}
                          )),
                  Builder(
                      builder: (context) => ListTile(
                          leading: Icon(Icons.logout),
                          title: Text("Logout"),
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          })),
                ],
              ),
            ),
            appBar: AppBar(
              actions: [
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                        icon: const Icon(
                          Icons.home,
                          color: Colors.green,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/HomePage',
                          );
                        });
                  },
                ),
              ],
              backgroundColor: Colors.lime[50],
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.green, size: 35),
                onPressed: () => Navigator.of(context).pop(),
              ),
              leadingWidth: 105,
              title: Text(
                "fresh your plant",
                style: TextStyle(
                    color: Colors.black, fontSize: 23, fontFamily: 'Dancing'),
              ),
              centerTitle: true,
            ),
            body: EditProgram(
              id: id,
            ),
          ),
        ));
  }
}

class EditProgram extends StatefulWidget {
  int id;
  EditProgram({required this.id});

  @override
  State<EditProgram> createState() => _EditProgramState(id);
}

class _EditProgramState extends State<EditProgram> {
  int id;
  _EditProgramState(this.id);
  late int currentValue = 9;
  List<String> status = ["Low", "Medium", "High"];
  List<String> daysOfWeek = [];
  late String statusValue = "Low";
  List<DayInWeek> dayObjects = [];
  final _formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final DatabaseReference dbref =
    FirebaseDatabase.instance.ref().child("Schedule/$id");
    dbref.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic data = dataSnapshot.value;
      // Do something with the data
      print(data['days']);
      setState(() {
        dateController.text = data['date'];
        timeController.text = data['time'];
        statusValue = data['speed'];
        currentValue = int.parse(data['duration']);
        daysOfWeek=[...(data['days'])];
        print( "after${daysOfWeek}");
        dayObjects = daysOfWeek.map((day) => DayInWeek(day)).toList();
        print("yaqoot ${dayObjects}");
      });
    });
  }
  List<DayInWeek> _days = [
    DayInWeek(
      "Sun",
    ),
    DayInWeek(
      "Mon",
    ),
    DayInWeek(
      "Tue",
      //isSelected: true
    ),
    DayInWeek(
      "Wed",
      // isSelected: true
    ),
    DayInWeek(
      "Thu",
    ),
    DayInWeek(
      "Fri",
    ),
    DayInWeek(
      "Sat",
    ),
  ];


  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            child: Image.asset('assets/Cover.jpg',
                opacity: AlwaysStoppedAnimation(.1), fit: BoxFit.cover)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              "     Edit your program:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  fontFamily: 'Courgette'),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 20,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text("Start date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 350),
                      child: TextField(
                        readOnly: true,
                        controller: dateController,
                        decoration: const InputDecoration(
                          hintText: 'Start Date',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightGreen)),
                          suffixIcon: Icon(Icons.date_range),
                        ),
                        onTap: () async {
                          var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: Colors.lightGreen,
                                    onPrimary: Colors.black87,
                                    onSurface: Colors.blueGrey,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      primary:
                                          Colors.black87, // button text color
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (date != null) {
                            dateController.text =
                                DateFormat('MM/dd/yyyy').format(date);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    Text("Time",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 350),
                      child: TextField(
                        readOnly: true,
                        controller: timeController,
                        decoration: const InputDecoration(
                          hintText: 'Start Time',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Colors.lightGreen)),
                          suffixIcon: Icon(Icons.access_time_outlined),
                        ),
                        onTap: () async {
                          var time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            builder: (context, child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: Colors.lightGreen,
                                    onSurface: Colors.blueGrey,
                                  ),
                                  buttonTheme: ButtonThemeData(
                                    colorScheme: ColorScheme.light(
                                      primary: Colors.green,
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (time != null) {
                            timeController.text = time.format(context);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    Text("Duration",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                    Slider(
                      min: 0.0,
                      max: 200.0,
                      activeColor: Colors.lightGreen,
                      inactiveColor: Colors.lightGreen.shade200,
                      thumbColor: Colors.green[900],
                      divisions: 200,
                      value: currentValue.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          currentValue = value.round();
                        });
                      },
                    ),
                    Text(
                        "Duration of watering ${currentValue.toString()} minutes"),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Speed of water pump",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    FormField<String>(builder: (FormFieldState<String> state) {
                      return DropdownButton<String>(
                        value: statusValue,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        dropdownColor: Colors.lightGreen[50],
                        iconSize: 35,
                        isExpanded: true,
                        items: status.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              "   ${value}",
                              style: TextStyle(fontSize: 19),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            statusValue = value!;
                          });
                        },
                      );
                    }),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Days of week",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FormField<List<String>>(
                        builder: (FormFieldState<List<String>> state) {
                      return SelectWeekDays(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        days: _days.map((day) {
                          print(dayObjects.contains(day.dayName));
                          day.isSelected = dayObjects.contains(day.dayName);
                          print(day.isSelected);
                          return day;
                        }).toList(),
                        boxDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(33.0),
                            color: Colors.lightGreen[300]),
                        onSelect: (values) {
                          // <== Callback to handle the selected days
                          daysOfWeek = values;
                        },
                      );

                    }),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      color: Colors.lightGreen.shade200,
                      height: 40,
                      child: TextButton(
                          onPressed: () {
                            final DatabaseReference dbref = FirebaseDatabase
                                .instance
                                .ref()
                                .child("Schedule/$id");
                            dbref.update({
                              'date': dateController.text,
                              'time': timeController.text,
                              'duration': currentValue.toString(),
                              'days': (daysOfWeek),
                              'speed': statusValue.toString()
                              // add as many fields as you want to update
                            });
                            MessageDialog(
                              dialogBackgroundColor: Colors.grey[50],
                              buttonOkColor: Colors.lightGreen[300],
                              message: 'Updated Done !',
                              title: '✓',
                            ).show(context);
                          },
                          child: Text(
                            'Edit program',
                            style: TextStyle(color: Colors.black87),
                          )),
                    )
                  ],
                ))
          ],
        )
      ],
    );
  }
}
