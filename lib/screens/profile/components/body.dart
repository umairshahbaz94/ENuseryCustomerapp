import 'package:flutter/material.dart';
import 'package:shop_app/Myplants.dart';
import 'package:shop_app/Task/alltask.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/selectplant.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "All Task ",
            icon: "assets/icons/Bell.svg",
            press: () { Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Activetask()));

            },
          ),
          ProfileMenu(
            text: "My Plants",
            icon: "assets/icons/Settings.svg",
            press: () {
Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Visiter()));

            },
          ),
          InkWell(
            onTap: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Selectplant()));
            },
                      child: ProfileMenu(
              text: "Add plants",
              icon: "assets/icons/Settings.svg",
              press: () {
                 Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Selectplant()));
              },
            ),
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {

 Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));

            },
          ),
        ],
      ),
    );
  }
}
