import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Cartservice {
  CollectionReference cart = FirebaseFirestore.instance.collection('cart');

  User? user = FirebaseAuth.instance.currentUser;
  int qty = 1;

  Future<void> addtocart(document) {
    cart.doc(user!.uid).set({
      "status": "false",
      'UserID': user!.uid,
    });
    return cart.doc(user!.uid).collection('products').add({
      'Productname': document.data()['prodcuctname'],
      'ProductPrice': document.data()['Price'],
      'ProdcutId': document.data()['ProdcutId'],
      'qty': qty,
      'productimage': document.data()['productimage'],
    });
  }

  removecard(docid) {
    cart.doc(user!.uid).collection("products").doc(docid).delete();
  }
}
