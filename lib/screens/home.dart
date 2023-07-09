import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Modals/Operation.dart';
import 'Calculator.dart';
import 'main_conainer.dart';

class Home extends StatelessWidget {

  late String _fakerName;
  late List<Operation> _operationss;

  List<Operation> get operations => _operationss;

  set operations(List<Operation> value) {
    _operationss = value;
  }

  String get fakerName => _fakerName;

  set fakerName(String value) {
    _fakerName = value;
  }


  Home(String fakerName,List<Operation> operations){
    _fakerName = fakerName;
    _operationss = operations;
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Hi ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    fakerName,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              IconButton(
                color: Colors.blue,
                onPressed: () {
                  print("info icon clicked");
                },
                icon: Icon(
                  Icons.info,
                  color: Colors.blue,
                ),
              )
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                  mainContainer(Calculator(_operationss))));
            },
            child: Text("Go"),
          )
        ],
      ),
    );
  }
}
