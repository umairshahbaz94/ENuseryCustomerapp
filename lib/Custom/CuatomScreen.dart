import 'package:flutter/material.dart';

class CustomerScreen extends StatefulWidget {
  static String routeName = "/Customscreen";
  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  Map<String, bool> plants = {
    'Indoor plants': false,
    'outdoor plants': false,
    'evergreen plants': false,
    'seasonal plants': false,
    'Fruits': false,
  };
  var temparraysize = [];
  final TextEditingController textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              child: Image.asset("assets/images/Custom.jpg", fit: BoxFit.fill),
            ),
            Divider(),
            Container(
              color: Colors.green,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text("Total Area=10m"),
              ),
            ),
            Text("Please enter the Type  of plants in your Lwan"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        color: Colors.lightGreen,
                        height: 80,
                        child: Column(
                          children: [
                            Text("Enter A"),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value != null &&
                                      value.trim().length < 3) {
                                    return 'This field requires a minimum of 3 characters';
                                  }

                                  return null;
                                },
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(),
                                    labelText: 'Enter Your Name',
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 5))),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        color: Colors.lightGreen,
                        height: 80,
                        child: Column(
                          children: [
                            Text("Enter B"),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value != null &&
                                      value.trim().length < 3) {
                                    return 'This field requires a minimum of 3 characters';
                                  }

                                  return null;
                                },
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(),
                                    labelText: 'Enter Your Name',
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 5))),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        color: Colors.lightGreen,
                        height: 80,
                        child: Column(
                          children: [
                            Text("Enter C"),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value != null &&
                                      value.trim().length < 3) {
                                    return 'This field requires a minimum of 3 characters';
                                  }

                                  return null;
                                },
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(),
                                    labelText: 'Enter Your Name',
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 5))),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        color: Colors.lightGreen,
                        height: 80,
                        child: Column(
                          children: [
                            Text("Enter D"),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value != null &&
                                      value.trim().length < 3) {
                                    return 'This field requires a minimum of 3 characters';
                                  }

                                  return null;
                                },
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(),
                                    labelText: 'Enter Your Name',
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 5))),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(height: 1, width: 200, color: Colors.black),
            ),
            Text("Please enter the Type  of plants in your Lwan"),
            Divider(),
            Text("Select Size"),
            Column(
              children: plants.keys.map((String keys) {
                return new CheckboxListTile(
                  title: new Text(keys),
                  value: plants[keys],
                  activeColor: Colors.pink,
                  checkColor: Colors.white,
                  onChanged: (values) async {
                    setState(() {
                      plants[keys] = values!;
                      if (values) {
                        temparraysize.add(keys);
                      } else {
                        temparraysize.remove(keys);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(height: 1, width: 200, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add plants in the garden"),
                  Stack(
                    children: [
                      Container(
                        color: Colors.green,
                      ),
                      Container(
                        color: Colors.green,
                        child: Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
