import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();

}

class _InfoState extends State<Info> {
  var jsonData;
  var Keys = ["About", "Year", "Developer","Email","Phone"];

  // final List<String> data = <String>[
  //   'About: Perform some basic arithmetic operations',
  //   'Year: 2023',
  //   'Developer: Mohamed AHBALY',
  //   'Email: ahbalymo@gmail.com',
  //   'Phone: 07 17 XX XX XX'
  // ];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/info.json');
    final data = await json.decode(response);
    setState(() {
      jsonData = data;
      print(jsonData);
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue.shade100,
      ),
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: Keys.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(5.0),
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                border: Border(
                  left: BorderSide(width: 10.0, color: Colors.deepOrange),
                ),
              ),
              child: Text(
                '${Keys[index]} : ${jsonData[Keys[index]]}',
                style: TextStyle(
                  backgroundColor: Colors.amber.shade100,
                  fontSize: 17,
                ),

              ),
            );

          }),
    );
  }
}
