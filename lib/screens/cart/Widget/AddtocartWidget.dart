import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Provider/CartProvider.dart';
import 'package:shop_app/Service/CartService.dart';
import 'package:shop_app/screens/cart/Widget/Counter.dart';

class AddtocardWidget extends StatefulWidget {
  final DocumentSnapshot document;

  AddtocardWidget({required this.document});
  @override
  _AddtocardWidgetState createState() => _AddtocardWidgetState();
}

class _AddtocardWidgetState extends State<AddtocardWidget> {
  Cartservice _cartservice = new Cartservice();
  User? user = FirebaseAuth.instance.currentUser;
  bool status = true;
  bool exit = false;
  @override
  void initState() {
    getCartData();
    getdata();
    super.initState();
  }

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
          });
        }
      });
    });
  }

  getCartData() async {
    final snapshot =
        await _cartservice.cart.doc(user!.uid).collection('products').get();
    if (snapshot.docs.length == 0) {
      setState(() {
        status = false;
      });
    } else {
      setState(() {
        status = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _carprovider = Provider.of<CartProvider>(context);
    return status
        ? Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
          )
        : exit
            ? Counterwidget(
                document: widget.document,
              )
            : Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  child: FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      EasyLoading.show(status: 'Adding To Cart');
                      _cartservice.addtocart(widget.document).then((value) {
                        getdata();
                        _carprovider.gettotalbill();
                        EasyLoading.showSuccess('Added To Cart');
                      });
                    },
                    child: Center(child: Text('Add To Cart')),
                  ),
                ),
              );
  }
}
