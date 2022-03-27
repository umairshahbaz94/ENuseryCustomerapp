import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Provider/CartProvider.dart';

import 'package:shop_app/Service/CartService.dart';
import 'package:shop_app/screens/cart/Widget/AddtocartWidget.dart';

class Counterwidget extends StatefulWidget {
  final DocumentSnapshot document;

  Counterwidget({required this.document});

  @override
  _CounterwidgetState createState() => _CounterwidgetState();
}

class _CounterwidgetState extends State<Counterwidget> {
  User? user = FirebaseAuth.instance.currentUser;
  CartProvider cartProvider = new CartProvider();
  Cartservice _cartservice = new Cartservice();
  late int qty;

  bool status = true;
  bool exit = false;
  bool update = false;
  late String docids;
  getdata() {
    FirebaseFirestore.instance
        .collection('cart')
        .doc(user!.uid)
        .collection('products')
        .where('ProdcutId',
            isEqualTo: (widget.document.data() as Map)['ProdcutId'])
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["ProdcutId"]);

        if (doc["ProdcutId"] == (widget.document.data() as Map)['ProdcutId']) {
          setState(() {
            exit = true;
            qty = doc["qty"];
            docids = doc.id;
            print(qty);
          });
        } else {
          exit = false;
        }
      });
    });
  }

  @override
  void initState() {
    getdata();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _carprovider = Provider.of<CartProvider>(context);
    return exit
        ? Container(
            height: 28,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pink),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          update = true;
                        });
                        if (qty == 1) {
                          cartProvider.delete(docids).then((value) {
                            
                            getdata();
                            setState(() {
                              _carprovider.gettotalbill();
                              update = false;
                              exit = false;
                            });
                          });
                        }
                        if (qty > 1) {
                          setState(() {
                            qty--;
                            update = true;
                          });

                          cartProvider
                              .quantityupdate(docids, qty)
                              .then((value) {
                            setState(() {
                              _carprovider.gettotalbill();
                              update = false;
                            });
                          });
                        }
                      },
                      child: Icon(
                          qty == 1 ? Icons.delete_outlined : Icons.remove,
                          color: Colors.pink)),
                ),
                Container(
                  color: Colors.pink,
                  width: 30,
                  height: double.infinity,
                  child: FittedBox(
                      child: update
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.blue))
                          : Text(qty.toString())),
                ),
                Container(
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          qty++;
                          update = true;
                        });
                        cartProvider
                            .quantityupdate(docids, qty)
                            .whenComplete(() {
                          setState(() {
                            _carprovider.gettotalbill();
                            update = false;
                          });
                        });
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.pink,
                      )),
                ),
              ],
            ),
          )
        : AddtocardWidget(document: widget.document);
  }
}
