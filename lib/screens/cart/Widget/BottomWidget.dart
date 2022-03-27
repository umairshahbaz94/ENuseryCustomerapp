import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/Widget/AddtocartWidget.dart';

class Bottomsheetcontainer extends StatefulWidget {
  final DocumentSnapshot document;
  final selectsize;
  final selectcolor;
  Bottomsheetcontainer({required this.document, this.selectsize,this.selectcolor});
  @override
  _BottomsheetcontainerState createState() => _BottomsheetcontainerState();
}

class _BottomsheetcontainerState extends State<Bottomsheetcontainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddtocardWidget(
            document: widget.document)
      ],
    );
  }
}
