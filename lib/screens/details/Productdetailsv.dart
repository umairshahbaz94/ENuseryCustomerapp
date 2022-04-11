import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shop_app/Myplants.dart';
import 'package:shop_app/screens/cart/Widget/BottomWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Productdetsilv extends StatefulWidget {
  Productdetsilv({required this.document});
  final document;
  @override
  _ProductdetsilvState createState() => _ProductdetsilvState();
}

class _ProductdetsilvState extends State<Productdetsilv> {
  var _auth = FirebaseAuth.instance.currentUser;

  save() {
    var _auth = FirebaseAuth.instance.currentUser;
   
    var timestamp = DateTime.now().microsecondsSinceEpoch;
    try {
      CollectionReference _b0oking =
          FirebaseFirestore.instance.collection('MyPants');
      _b0oking.doc(timestamp.toString()).set({
        'Email': _auth!.email.toString(),
        'Name': (widget.document.data() as Map)['prodcuctname'],
        'Image': (widget.document.data() as Map)['productimage'],
      });
      EasyLoading.showSuccess("Add Plant in your garden");
        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (
                                      Visiter()
                                      )));
    } 
    
    
    
    catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  String selectsize = "";
  String color = "";
  late int selectindex;
  late int selectindexs;
  String selectindexSizes = "";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Product Details"),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        image: new DecorationImage(
                            image: NetworkImage(((widget.document.data()
                                as Map)['productimage'])))),
                  ),
                ),
              ),
              // Expanded(

              //                 child: Column(
              //     children: [
              //       Expanded(
              //         flex: 1,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.all(0.0),
              //               child: Text("Select Color",style: TextStyle(color:Colors.black),),
              //             ),
              //             Flexible(
              //               flex: 1,
              //               child: ListView.builder(
              //                   scrollDirection: Axis.horizontal,
              //                   itemCount: (widget.document.data() as Map)['Colors'].length,
              //                   itemBuilder: (BuildContext context, int index) {
              //                     return Row(
              //                       children: [
              //                         Padding(
              //                           padding: const EdgeInsets.all(10.0),
              //                           child: InkWell(
              //                             onTap: () {
              //                               setState(() {
              //                                 selectindex = index;
              //                                 color = (widget.document.data() as Map)['Colors']
              //                                     [index];
              //                               });
              //                             },
              //                             child: Container(
              //                               width: 50,
              //                               decoration: BoxDecoration(
              //                                   borderRadius:
              //                                       BorderRadius.circular(20),
              //                                   color: selectindex != index
              //                                       ? Colors.grey
              //                                       : Colors.blue),
              //                               height: 30,
              //                               child: Center(
              //                                   child: Text(
              //                                 (widget.document.data() as Map)['Colors']
              //                                             [index] ==
              //                                         null
              //                                     ? Text("No Colors Add")
              //                                     : (widget.document.data() as Map)['Colors']
              //                                         [index],
              //                                 style: TextStyle(color: Colors.black),
              //                               )),
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     );
              //                   }),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Expanded(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //        Padding(
              //          padding: const EdgeInsets.all(0.0),
              //          child: Text("Select Size",style: TextStyle(color:Colors.black)),
              //        ),
              //       Padding(
              //         padding: const EdgeInsets.all(0.0),
              //       ),
              //       Flexible(
              //         flex: 1,
              //         child: ListView.builder(
              //             scrollDirection: Axis.horizontal,
              //             itemCount: (widget.document.data() as Map)['Sizes'].length,
              //             itemBuilder: (BuildContext contex, int indexs) {
              //               return Row(
              //                 children: [
              //                   Padding(
              //                     padding: const EdgeInsets.all(10.0),
              //                     child: InkWell(
              //                       onTap: () {
              //                         setState(() {
              //                           selectindexs = indexs;
              //                           selectsize =(widget.document.data() as Map)['Sizes'][indexs];
              //                         });
              //                       },
              //                       child: Container(
              //                         width: 50,
              //                         decoration: BoxDecoration(
              //                             borderRadius:
              //                                 BorderRadius.circular(20),
              //                             color: selectindexs != indexs
              //                                 ? Colors.grey
              //                                 : Colors.green),
              //                         height: 30,
              //                         child: Center(
              //                             child: Text(
              //                           (widget.document.data() as Map)['Sizes']
              //                                       [indexs] ==
              //                                   null
              //                               ? Text("No Colors Add")
              //                               : (widget.document.data() as Map)['Sizes']
              //                                   [indexs],
              //                           style: TextStyle(color: Colors.black),
              //                         )),
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               );
              //             }),
              //       ),
              //     ],
              //   ),
              // ),
              Flexible(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Description',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                children: [
                                  Text(
                                    '${(widget.document.data() as Map)['Prodcutdescription']} ',
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Price :',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                          ' \$${(widget.document.data() as Map)['Price']}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                child: FlatButton(
                                  color: Colors.red,
                                  onPressed: () {
                                    save();
                                     EasyLoading.show(status: "Processing");
                                  },
                                  child: Center(
                                      child: Text('Add in Your Plant gardner')),
                                ),
                              ),
                            )
                            // Bottomsheetcontainer(
                            //   document: widget.document,
                            //   selectsize: selectsize,
                            //   selectcolor: color,
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class Addtocart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        child: FlatButton(
          color: Colors.red,
          onPressed: () {},
          child: Center(child: Text('Add in Your Plant')),
        ),
      ),
    );
  }
}
