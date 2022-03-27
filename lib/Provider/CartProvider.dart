import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:shop_app/Service/CartService.dart';

class CartProvider with ChangeNotifier {
  double total = 0.0;
  User? user = FirebaseAuth.instance.currentUser;
  int qty = 1;

  late QuerySnapshot snapshot;
  var  cartqty;
  List cartlist = [];
  Cartservice _cartservices = new Cartservice();
  Future<double?> gettotalbill() async {
    List _newlist = [];
    var cartotal = 0.0;
    QuerySnapshot querySnapshot = await _cartservices.cart
        .doc(_cartservices.user!.uid)
        .collection("products")
        .get();
        
    if (querySnapshot == null) {
      return null;
    } else {
      querySnapshot.docs.forEach((element) {
        if (!_newlist.contains(element.data())) {
          _newlist.add(element.data());
          this.cartlist = _newlist;
          notifyListeners();
        }
        cartotal += (element.data() as Map)["ProductPrice"] * (element.data()as Map)["qty"];
      });
      this.total = cartotal;

      notifyListeners();
      this.cartqty = querySnapshot.size;
      notifyListeners();
      this.snapshot = querySnapshot;
      notifyListeners();
      return cartotal;
    }
  }

  Future<void> quantityupdate(docid, qty) {
    // Create a reference to the document the transaction will use
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('cart')
        .doc(user!.uid)
        .collection('products')
        .doc(docid);

    return FirebaseFirestore.instance
        .runTransaction((transaction) async {
          // Get the document
          DocumentSnapshot snapshot = await transaction.get(documentReference);

          if (!snapshot.exists) {
            throw Exception("Prodcut Not Exist Cart");
          }

          // Update the follower count based on the current count
          // Note: this could be done without a transaction
          // by updating the population using FieldValue.increment()

          // Perform an update on the document
          transaction.update(documentReference, {'qty': qty});
          gettotalbill();

          // Return the new count
          return qty;
        })
        .then((value) => print("updated quantity $value"))
        .catchError((error) => print("Failed to update quantity: $error"));
  }

  Future<void> delete(docid) async {
    await FirebaseFirestore.instance
        .collection('cart')
        .doc(user!.uid)
        .collection('products')
        .doc(docid)
        .delete();
  }
}
