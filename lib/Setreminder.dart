import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shop_app/Task/alltask.dart';

class Setreminder extends StatefulWidget {
  Setreminder({required this.document});
  final document;
  @override
  _SetreminderState createState() => _SetreminderState();
}

class _SetreminderState extends State<Setreminder> {

  TimeOfDay selectedTime = TimeOfDay.now();
  var dropdownvalueservice;
  var rountine;
  var name="loading";
  save() {
    var _auth = FirebaseAuth.instance.currentUser;
    EasyLoading.show(status: "Processing");
    var timestamp = DateTime.now().microsecondsSinceEpoch;
    try {
      CollectionReference _b0oking =
          FirebaseFirestore.instance.collection('reminder');
      _b0oking.doc(timestamp.toString()).set({
        'Email': _auth!.email.toString(),
        'Name': this.widget.document.data()['Name'],
        'Image': this.widget.document.data()['Image'],
        "Time": selectedTime.toString(),
        "Routine": rountine.toString(),
        "TaskType": dropdownvalueservice.toString(),
        "status":"Pending"
      });
      EasyLoading.showSuccess("Add Reminder");
      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (
                                     Activetask()
                                      )));
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      name=this.widget.document.data()['Image'];
    });
  }

  @override
  Widget build(BuildContext context) {
    List type = ["Watering", "Misting", "Fertilizing", "Rotating"];
    List routine = ["After 1 day", "Daily", "Weekly(7days)", "Monthly(30days)"];
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Reminder"),
        actions: [InkWell(onTap: (){save();},child: Icon(Icons.save))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(child: ListTile(leading: Text("Plant"), trailing: Text(widget.document.data()['Name']))),
          Text("Select Task Type"),
          
            
           DropdownButton(
          isExpanded: true,
              value: dropdownvalueservice,
              hint: Text("select Type"),
              isDense: true,
              onChanged: (newValue) async {
                setState(() {
                  dropdownvalueservice = newValue.toString();
                  print(newValue);
                });
              },
              items: type.map((e) {
                print(e);
                return new DropdownMenuItem(
                    value: e,
                    child: new Container(
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(5.0)),

                      //color: primaryColor,
                      child: new Text(e),
                    ));
              }).toList(),
            ),
          
         Text("Select Task Routine"),
          DropdownButton(
            isExpanded: true,
            value: rountine,
            hint: Text("select Routine"),
            isDense: true,
            onChanged: (newValue) async {
              setState(() {
                rountine = newValue.toString();
                print(newValue);
              });
            },
            items: routine.map((e) {
              print(e);
              return new DropdownMenuItem(
                  value: e,
                  child: new Container(
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(5.0)),

                    //color: primaryColor,
                    child: new Text(e),
                  ));
            }).toList(),
          ),
          Text("Select Time "),
          
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                   Text("${selectedTime.hour}:${selectedTime.minute}"),
                ElevatedButton(
                  onPressed: () {
                    _selectTime(context);
                  },
                  child: Text("Choose Time"),
                ),
              ],
            ),
          ),
       
        ],
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}
