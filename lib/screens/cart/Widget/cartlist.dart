import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Provider/CartProvider.dart';
import 'package:shop_app/Service/CartService.dart';

import 'package:shop_app/screens/cart/Widget/Counter.dart';


class CrtList extends StatefulWidget {
  static String routeName = "/cartlist";
  @override
  _CrtListState createState() => _CrtListState();
}

class _CrtListState extends State<CrtList> {


  Cartservice cart = new Cartservice();
bool  nodata=false;

    
  Widget addbutton() {
    return FlatButton(
      onPressed: () {
// cart.removecard(docid);
      },
      child: Text("Delete"),
      color: Colors.red,
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _carprovider=Provider.of<CartProvider>(context,listen: true);
    
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart List"),
        actions: [],
      ),
      
      bottomSheet:_carprovider.cartqty!=0?Row(
        children: [

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Qnt:${_carprovider.cartqty } | Total-Amount \$ ${_carprovider.total} '),
          ),
       Expanded(
              child: Container(
                height: 50,
            child: 
            
             InkWell( 
              
              onTap: (){
                   },)
          )),
        ],
      ):
      Row(
        children: [

          // Text('Qnt:${_carprovider.cartqty } | ${_carprovider.total} '),
       Expanded(
              child: Container(
                height: 50,
              )
       ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: cart.cart.doc(cart.user!.uid).collection('products').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.docs.length == 0) {
          
            return Center(child: Text("No Product in your Cart "));
          }
          return new ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
            //     setState(() {
            //   nodata=false;
            // });
              return new ListTile(
                onTap: () {},
                leading: Card(
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Image.network((document.data() as Map)['productimage']),
                  ),
                ),
                title: new Text((document.data() as Map)['Productname']),
                subtitle: new Text('\$${(document.data() as Map)['ProductPrice'].toString()}'),
                trailing: FittedBox(
                                  child: Column(
                    children: [
                      // FlatButton(
                      //   onPressed: () {
                      //     cart.removecard(document.id);
                      //   },
                      //   child: Text("Delete"),
                        
                      //   color: Colors.red,
                      // ),
Counterwidget(document:document)

                
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
