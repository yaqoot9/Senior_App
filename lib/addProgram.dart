import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class add extends StatelessWidget {
  const add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body:AddProgram() ,
      ),
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
 List<String> staus=["Low","Medium","High"];
 String statusValue="Low";
  final _formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final timeController=TextEditingController();
  @override

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("set your program",style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.left,),
        SizedBox(height: 50,),
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
          var time = await showTimePicker(context: context, initialTime:TimeOfDay.now() );
          if (time != null) {
            timeController.text=time.format(context);
          }
        },
      ),),
        SizedBox(height: 23,),
        Text("duration",style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.left),
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
              Text("speed of water pump",style: TextStyle(fontWeight: FontWeight.bold),),
              FormField<String>(builder:  (FormFieldState<String> state){return DropdownButton<String>(
                value:statusValue,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                dropdownColor:Colors.lightGreen[50],
                iconSize:35,
                isExpanded: true,
                items: staus.map((String value) {
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

              ) ],
    )

    )
    ],

    );
  }
}
