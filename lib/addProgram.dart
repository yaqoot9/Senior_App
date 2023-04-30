import 'package:firstapp/Details.dart';
import 'package:firstapp/Login.dart';
import 'package:firstapp/home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:day_picker/day_picker.dart';
import 'package:dialogs/dialogs.dart';
import 'package:firebase_database/firebase_database.dart';

import 'programs.dart';


class add extends StatelessWidget {
  const add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/HomePage':(BuildContext context) =>Home (),
        '/DeteilsPage':(BuildContext context)=>detailsPage(),
        '/login':(BuildContext context)=>LoginPage(),
        '/myprogram':(BuildContext context)=>programmsPage(),
      },
      debugShowCheckedModeBanner: false,
      home:SafeArea(child:Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(decoration: BoxDecoration(),child: Center(
                child: Column(children: [
                  CircleAvatar(
                    radius: 40, // Image radius
                    backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.K7lG3005eY-tEHwlxf61qgHaFx?pid=ImgDet&rs=1"),
                  ),
                  Text("Ahmad Awad",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Text("Ahmad@gmail.com")
                ],),
              ),),

              Builder(builder: (context)=>ListTile(
                leading: Icon(Icons.person),
                title: Text("User information"),
                // onTap:() {Navigator.pushNamed(context,'/NotificationPage');}
              )),

              Builder(builder: (context)=>
                  ListTile(
                      leading: Icon(Icons.date_range),
                      title: Text("My programs"),
                      onTap:() {Navigator.pushNamed(context,'/myprogram');}
                  )),

              Builder(builder: (context)=>ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("Notification"),
                  onTap:() {Navigator.pushNamed(context,'/NotificationPage');}
              )),


              Builder(builder: (context)=>ListTile(
                leading: Icon(Icons.help),
                title: Text("Help"),
                // onTap:() {Navigator.pushNamed(context,'/NotificationPage');}
              ) ) ,

              Builder(builder: (context)=>ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                  onTap:() {Navigator.pushNamed(context,'/login');}
              ) ),
            ],
          ),
        ),

        appBar:AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF7CB342),size: 35),
            onPressed: () => Navigator.of(context).pop(),
          ),
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
          leadingWidth: 105,
          title:
          Text("fresh your plant",style: TextStyle(color: Colors.black,fontSize: 18),),

          centerTitle: true,),
        body:AddProgram() ,
      ),)
    );
  }
}
class AddProgram extends StatefulWidget {
  const AddProgram({Key? key}) : super(key: key);

  @override
  State<AddProgram> createState() => _AddProgramState();
}

class _AddProgramState extends State<AddProgram> {
 int currentValue = 30;
 List<String> status=["Low","Medium","High"];
 List<String> daysOfWeek=[];
 String statusValue="Low";
  final _formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final timeController=TextEditingController();
 DatabaseReference dbref = FirebaseDatabase.instance.ref().child("Schdule/12");

 List<DayInWeek> _days = [
   DayInWeek(
     "Sun",
   ),
   DayInWeek(
     "Mon",
   ),
   DayInWeek(
       "Tue",
       isSelected: true
   ),
   DayInWeek(
     "Wed",
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25,),
        //Text("     set your program:",style: TextStyle(fontWeight: FontWeight.bold,fontSize:23),textAlign:TextAlign.left,),
        //SizedBox(height: 50,),
        Form(key: _formKey,
          child:Column(

            children: [
              Text("Start date",style:TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.left),
            ConstrainedBox(constraints: BoxConstraints.tightFor(width: 350),
    child:TextField(
    readOnly: true,
    controller: dateController,
    decoration: const InputDecoration(hintText: 'Start Date', enabledBorder: OutlineInputBorder(borderSide:  BorderSide(color: Colors.lightGreen)), suffixIcon: Icon(Icons.date_range),),
    onTap: () async {
    var date = await showDatePicker(
    context: context,
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
    primary: Colors.black87, // button text color
    ),
    ),
    ),
    child: child!,
    );},
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100));
    if (date != null) {
    dateController.text = DateFormat('MM/dd/yyyy').format(date);
    }
    },
    ),),
    SizedBox(height: 23,),
    Text("Time",style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.left),
    ConstrainedBox(constraints: BoxConstraints.tightFor(width: 350) ,
      child:TextField(
        readOnly: true,
        controller: timeController,
          decoration: const InputDecoration(hintText: 'Start Time', enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.lightGreen)), suffixIcon: Icon(Icons.access_time_outlined),),
        onTap: () async {
          var time = await showTimePicker(context: context, initialTime:TimeOfDay.now(),
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
            },);
          if (time != null) {
            timeController.text=time.format(context);
          }
        },
      ),),
        SizedBox(height: 23,),
        Text("Duration",style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.left),
              Slider(
                min: 0.0,
                max: 200.0,
                activeColor: Colors.lightGreen,
                inactiveColor: Colors.lightGreen.shade200,
                thumbColor: Colors.green[900],
                divisions: 200 ,
                value:currentValue.toDouble() ,
                onChanged: (value) {
                  setState(() {
                    currentValue = value.round();
                  });
                },
              ),
              Text("Duration of watering ${currentValue.toString()} minutes"),
              SizedBox(height: 30,),
              Text("Speed of water pump",style: TextStyle(fontWeight: FontWeight.bold),),
              FormField<String>(builder:  (FormFieldState<String> state){return DropdownButton<String>(
                value:statusValue,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                dropdownColor:Colors.lightGreen[50],
                iconSize:35,
                isExpanded: true,
                items: status.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text("   ${value}",style: TextStyle(fontSize: 19),),
                  );
                }).toList(),
                onChanged: (String ?value) {
                  setState(() {
                    statusValue=value!;
                  });
                },
              );
              }
              ),
              SizedBox(height: 30,),
              Text("Days of week",style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),

    FormField<List<String>>(builder:  (FormFieldState<List <String>> state) {
      return SelectWeekDays(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        days: _days,
        boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(33.0),
         color: Colors.lightGreen[300]
        ),
        onSelect: (values) { // <== Callback to handle the selected days
        daysOfWeek=values;
        },
     );
    }
    ),
    SizedBox(height: 30,),
    Container(
      color: Colors.lime[200],height: 40,
      child:TextButton(onPressed:() async {

        await dbref.set({
          'date':dateController.text,
          'time':timeController.text,
          'duration':currentValue.toString(),
          'days':daysOfWeek.toString(),
          'speed':statusValue.toString()

        });
        MessageDialog(dialogBackgroundColor: Colors.grey[50],
          buttonOkColor: Colors.lightGreen[300],
          message: 'Added Done !',
          title: '✓',
        ).show(context);
      }
          , child: Text('Save program',style: TextStyle(color: Colors.black87),)),
    )
  ],
    )

    )
    ],

    );
    }
  }

