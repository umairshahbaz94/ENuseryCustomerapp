import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/Widget/BottomWidget.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({required this.document});
  final document;
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
                            Bottomsheetcontainer(
                              document: widget.document,
                              selectsize: selectsize,
                              selectcolor: color,
                            ),
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
  const Addtocart({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        child: FlatButton(
          color: Colors.blue,
          onPressed: () {},
          child: Center(child: Text('Add To Cart')),
        ),
      ),
    );
  }
}
