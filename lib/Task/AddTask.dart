import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Data extends StatefulWidget {
  static final route = '/SignUp';

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  var token;
  var selectcountry = "No select";
  // country() {
  //   showCountryPicker(
  //       context: context,
  //       countryListTheme: CountryListThemeData(
  //         flagSize: 25,
  //         backgroundColor: Colors.white,
  //         textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
  //         //Optional. Sets the border radius for the bottomsheet.
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(20.0),
  //           topRight: Radius.circular(20.0),
  //         ),
  //         //Optional. Styles the search field.
  //         inputDecoration: InputDecoration(
  //           labelText: 'Search',
  //           hintText: 'Start typing to search',
  //           prefixIcon: const Icon(Icons.search),
  //           border: OutlineInputBorder(
  //             borderSide: BorderSide(
  //               color: const Color(0xFF8C98A8).withOpacity(0.2),
  //             ),
  //           ),
  //         ),
  //       ),
  //       onSelect: (Country country) {
  //         setState(() {
  //           selectcountry = country.name;
  //         });
  //       });
  // }

  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool remember = false;
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  late String emailaddress;
  var password;
  var username;
  var des;
  var company;

  var address;
  var number;
  var number2;
  var returnmsg;

  saveData() {
    EasyLoading.show(status: "Processing");
    var timestamp = DateTime.now().microsecondsSinceEpoch;
    try {
      CollectionReference _b0oking =
          FirebaseFirestore.instance.collection('Data');
      _b0oking.doc(timestamp.toString()).set({
        'Email': emailaddress,
        'Name': username,
        'Designation': des,
        "Company": company,
        "City": address,
        "Number": number,
        "Contact 2": number2,
        "Country": selectcountry,
      });

      EasyLoading.showSuccess("Complete Successfully");
      setState(() {
        returnmsg = "Complete";
      });
    } catch (e) {
      setState(() {
        returnmsg = "Error";
      });
    }
    return returnmsg;
  }

  _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }

    _formKey.currentState!.save();
    _formKey.currentState!.reset();
    var mgs = saveData();

    print(mgs.toString());

    // await Provider.of<Auth>(context, listen: false).signup(
    //   _authData['email'] as String,
    //   _authData['password'] as String,
    // );
    // await Provider.of<Auth>(context, listen: false).userdetails(
    //   _authData['email'] as String,
    //   _authData['phoneno'] as String,
    //   _authData['username'] as String,
    //   _authData['password'] as String,
    //   _authData['Address'] as String,
    // );

    // Navigator.of(context).pushReplacementNamed(HomeScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => JailRecordCell()));
        return true;
      },
      child: Scaffold(
        appBar: (AppBar(
          actions: [
            InkWell(
                onTap: () {
                  _auth.signOut();
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => LoginScreen1()));
                },
                child: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ))
          ],
          backgroundColor: Colors.greenAccent,
          elevation: 0,
          leading: Image.asset(
            "assets/images/PAKCHEM.png",
            height: 100,
          ),
        )),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // FittedBox(
                          //   fit: BoxFit.fitWidth,
                          //   child: Container(
                          //     padding: EdgeInsets.only(left: 20),
                          //     child: Text(
                          //       "Book A STAND",
                          //       style: TextStyle(
                          //           fontSize:
                          //               (MediaQuery.of(context).size.width -
                          //                       MediaQuery.of(context)
                          //                           .padding
                          //                           .top) *
                          //                   0.060,
                          //           fontWeight: FontWeight.bold,
                          //           color: Colors.black),
                          //       textAlign: TextAlign.start,
                          //     ),
                          //   ),
                          // ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Container(
                              padding:
                                  EdgeInsets.only(left: 20, bottom: 30, top: 5),
                              child: Text(
                                "Get started!",
                                style: TextStyle(
                                    fontSize:
                                        (MediaQuery.of(context).size.width -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .top) *
                                            0.040,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600]),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15.0),
                                  child: Icon(
                                    Icons.person_outline,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  height: 30.0,
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.5),
                                  margin: const EdgeInsets.only(
                                      left: 00.0, right: 10.0),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Enter New Username',
                                      border: InputBorder.none,
                                      hintText: 'Username must be unique',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Invalid Username!';
                                      }
                                      if (value.length < 3) {
                                        return 'Username must be 3 character long';
                                      }
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        username = value;
                                      });
                                    },
                                    keyboardType: TextInputType.text,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15.0),
                                  child: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  height: 30.0,
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.5),
                                  margin: const EdgeInsets.only(
                                      left: 00.0, right: 10.0),
                                ),
                                new Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Desigination',
                                      border: InputBorder.none,
                                      hintText: 'Desigination',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Invalid Desigination!';
                                      }
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        des = value;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15.0),
                                  child: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  height: 30.0,
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.5),
                                  margin: const EdgeInsets.only(
                                      left: 00.0, right: 10.0),
                                ),
                                new Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Company Name',
                                      border: InputBorder.none,
                                      hintText: 'Company',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Company Invalid!';
                                      }
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        company = value;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15.0),
                                  child: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  height: 30.0,
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.5),
                                  margin: const EdgeInsets.only(
                                      left: 00.0, right: 10.0),
                                ),
                                new Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: 'Enter  Email',
                                      border: InputBorder.none,
                                      hintText:
                                          'Please follow the Email format',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.contains('@')) {
                                        return 'Invalid email!';
                                      }
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        emailaddress = value;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15.0),
                                  child: Icon(
                                    Icons.house,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  height: 30.0,
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.5),
                                  margin: const EdgeInsets.only(
                                      left: 00.0, right: 10.0),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      labelText: 'Enter  City',
                                      border: InputBorder.none,
                                      hintText: 'Lahore',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 2) {
                                        return 'Address must be 2 character long!';
                                      }
                                    },
                                    onChanged: (value) {
                                      address = value;
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15.0),
                                  child: Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  height: 30.0,
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.5),
                                  margin: const EdgeInsets.only(
                                      left: 00.0, right: 10.0),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Phone Number',
                                      border: InputBorder.none,
                                      hintText: '0305xxxxxxx',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 11) {
                                        return 'Phone is not correct!';
                                      }
                                    },
                                    onChanged: (value) {
                                      number = value;
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15.0),
                                  child: Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  height: 30.0,
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.5),
                                  margin: const EdgeInsets.only(
                                      left: 00.0, right: 10.0),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Phone Number',
                                      border: InputBorder.none,
                                      hintText: '0305xxxxxxx',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 11) {
                                        return 'Phone is not correct!';
                                      }
                                    },
                                    onChanged: (value) {
                                      number2 = value;
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     border: Border.all(
                          //       color: Colors.grey.withOpacity(0.5),
                          //       width: 1.0,
                          //     ),
                          //     borderRadius: BorderRadius.circular(20.0),
                          //   ),
                          //   margin: const EdgeInsets.symmetric(
                          //       vertical: 10.0, horizontal: 20.0),
                          //   child: Row(
                          //     children: <Widget>[
                          //       Padding(
                          //         padding: EdgeInsets.symmetric(
                          //             vertical: 10.0, horizontal: 15.0),
                          //         child: Icon(
                          //           Icons.lock_open,
                          //           color: Colors.black,
                          //         ),
                          //       ),
                          //       Container(
                          //         height: 30.0,
                          //         width: 1.0,
                          //         color: Colors.grey.withOpacity(0.5),
                          //         margin: const EdgeInsets.only(
                          //             left: 00.0, right: 10.0),
                          //       ),
                          //       Expanded(
                          //         child: TextFormField(
                          //           keyboardType: TextInputType.visiblePassword,
                          //           decoration: InputDecoration(
                          //             labelText: 'Enter Password',
                          //             border: InputBorder.none,
                          //             hintText:
                          //                 'Password must be atleast 6 digits',
                          //             hintStyle: TextStyle(
                          //                 color: Colors.grey, fontSize: 10),
                          //           ),
                          //           validator: (value) {
                          //             if (value!.isEmpty || value.length < 6) {
                          //               return 'Password is too short!';
                          //             }
                          //           },
                          //           onChanged: (value) {
                          //             setState(() {
                          //               password = value;
                          //             });
                          //           },
                          //           obscureText: true,
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),

                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 20.0),
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(
                                                  vertical: 25,
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          MediaQuery.of(context)
                                                              .padding
                                                              .top) *
                                              0.35),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black), // <-- Button color
                                      overlayColor: MaterialStateProperty
                                          .resolveWith<Color?>((states) {
                                        if (states
                                            .contains(MaterialState.pressed))
                                          return Color(
                                              0xffB788E5); // <-- Splash color
                                      }),
                                    ),
                                    child: const Text(
                                      "Save",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () => {_submit()},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Container(
                                //     child: Text(
                                //   "You already have an account?",
                                //   //style: TextStyle(
                                //   //fontWeight: FontWeight.bold),
                                // )),
                                // TextButton(
                                //   style: TextButton.styleFrom(
                                //     textStyle: const TextStyle(
                                //         fontSize: 12,
                                //         fontWeight: FontWeight.w800,
                                //         color: Colors.black),
                                //   ),
                                //   onPressed: () {
                                //     Navigator.pushReplacement(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 LoginScreen1()));
                                //   },
                                //   child: const Text('Book'),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
