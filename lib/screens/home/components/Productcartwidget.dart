import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/Productdetails.dart';

class ProductCardssubcategory extends StatelessWidget {
  ProductCardssubcategory({required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    Widget addbutton(document) {
      return FlatButton(
        onPressed: () {

          Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetails(
                                document: document,
                              )));
        },
        child: Text("View Details"),
        color: Colors.blue,
      );
    }

    CollectionReference prodcuts =
        FirebaseFirestore.instance.collection("products");

    Widget categoryall({@required name, @required image}) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            height: 150,
            width: 100,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
              SizedBox(height: 5),
              Center(
                  child: Text(
                name,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ))
            ]),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(this.name)),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("products")
            .where('Subcategory', isEqualTo: name)
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.docs.length == 0) {
            return Center(child: Text("No Product Available This category "));
          }

          return new ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return new ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetails(
                                document: document,
                              )));
                },
                leading: Card(
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Image.network((document.data() as Map)['productimage']),
                  ),
                ),
                title: new Text((document.data() as Map)['prodcuctname']),
                subtitle: new Text('  \$ ${(document.data() as Map)['Price'] }'),
                trailing: addbutton(document),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
