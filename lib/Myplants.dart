import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shop_app/Setreminder.dart';

class Visiter extends StatefulWidget {
  @override
  _VisiterState createState() => _VisiterState();
}

class _VisiterState extends State<Visiter> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('MyPants').snapshots();

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
            "MyPants",
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
                    child: Stack(
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
                        Positioned(
                            bottom: 20,
                            right: 20,
                            child: Text(
                              data['Name'],
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )),
                        Positioned(
                            bottom: 20,
                            left: 10,
                            child: InkWell(
                              onTap: (){
                                print(document);
 Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (
                                     Setreminder(document: document)
                                      )));
                                // Setreminder(document: document);
                              },
                                                          child: Container(
                                                            
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(top: 4),
                                                              child: Center(child: Text("set reminder")),
                                                            ),
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ))
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
