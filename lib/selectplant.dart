import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/Productdetails.dart';
import 'package:shop_app/screens/details/Productdetailsv.dart';
import 'package:shop_app/screens/home/components/section_title.dart';

import '../../../size_config.dart';


class Selectplant extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    CollectionReference prodcuts =
        FirebaseFirestore.instance.collection("products");

    return  Scaffold(
      appBar: AppBar(title: Text("All Plant"),),
          body: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
        
                child:  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("products")
                        
                        .snapshots(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:
                              snapshot.data!.docs.map((DocumentSnapshot document) {
                            return new SpecialOfferCard(
                              image: (document.data() as Map)['productimage'],
                              category: (document.data() as Map)['prodcuctname'],
                              numOfBrands: 0,
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Productdetsilv(
                                              document: document,
                                            )));
                              },
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),

                  // SpecialOfferCard(
                  //   image: "assets/images/Bamboo-Dress-summer-or-winter-4-300x270.jpg",
                  //   category: "Sleeveless Silk Top",
                  //   numOfBrands: 18,
                  //   press: () {},
                  // ),
                  // SpecialOfferCard(
                  //   image: "assets/images/Bamboo-Slips-6-300x270.jpg",
                  //   category: "Silk Camisole",
                  //   numOfBrands: 24,
                  //   press: () {},
                  // ),
               
          
        ),
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  });

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
               
                 Image.network(
                    image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
