import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/Services.dart';
import 'package:shop_app/screens/home/components/section_title.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SectionTitle(
                title: "Category",
                press: () {},
              ),
            ),
            Categories(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SectionTitle(
                title: "Service",
                press: () {},
              ),
            ),
            ServiceList(),
            SpecialOffers(cat: "plants"),
            SizedBox(height: getProportionateScreenWidth(30)),
            SpecialOffers(cat: "flower"),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
