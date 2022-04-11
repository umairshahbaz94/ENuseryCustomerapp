import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shop_app/Setreminder.dart';

class Activetask extends StatefulWidget {
  @override
  _ActivetaskState createState() => _ActivetaskState();
}

class _ActivetaskState extends State<Activetask> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('reminder').snapshots();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     EasyLoading.dismiss();
  }

  double scrolpostion = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text(
            "Task List",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              if (!snapshot.hasData) {
                return Center(child: Text("No Record Found"));
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Card(
                    shadowColor: Colors.greenAccent,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              data['Image'],
                              height: 180,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                
                             Text(
                              data['Name'],
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            
                        Row(
                              children: [
                                Text("Routine:"),
                                Text(
                                  data['Routine'],
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("TaskType:"),
                                Text(
                                  data['TaskType'],
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                              Row(
                              children: [
                                Text("Time:"),
                                Text(
                                  data['Time'].toString(),
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                              Row(
                              children: [
                                Text("status:"),
                                Text(
                                  data['status'].toString(),
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                    
                      ],
                    ),
                  );
                }).toList(),
              );
              // ListView.builder(
              //     scrollDirection: Axis.vertical,
              //     itemCount: _bannerimage.length,
              //     shrinkWrap: true,
              //     itemBuilder: (BuildContext context, index) {
              //       return

              // Card(
              //   shadowColor: Colors.greenAccent,
              //   child: Stack(
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: ClipRRect(
              //           borderRadius: BorderRadius.circular(20),
              //           child: Image.network(
              //             _bannerimage[index],
              //             height: 180,
              //             width: MediaQuery.of(context).size.width,
              //             fit: BoxFit.fill,
              //           ),
              //         ),
              //       ),
              //       Positioned(bottom: 20,right: 20,child: Text("Name",style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold),))
              //     ],
              //   ),
              // );
            }));
  }
}
