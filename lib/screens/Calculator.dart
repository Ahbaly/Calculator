import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Modals/Operation.dart';
import 'Result.dart';
import 'main_conainer.dart';

class Calculator extends StatefulWidget {

  late List<Operation> _operations;


  Calculator(List<Operation> operations){
    _operations = operations;
  }

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final List<Widget> _items = [];
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  late List<Operation> _operations ;
  late String? _op;

  @override
  void initState() {
    super.initState();

    _operations = widget._operations;
    _op = "+";

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _number1Controller,
            decoration: InputDecoration(hintText: "First number"),
          ),
          Column(
            children: [
              for (Operation op in _operations)
                RadioListTile(
                  title: Text(op.value),
                  value: op.value,
                  groupValue: _op,
                  onChanged: (value) {
                    setState(() {
                      _op = value.toString();
                      print(_op);
                    });
                  },
                ),
            ]
          ),
          TextField(
            controller: _number2Controller,
            decoration: InputDecoration(hintText: "Second number"),
          ),
          ElevatedButton(
            onPressed: () {
              try {
                int number1 = int.parse(_number1Controller.text);
                int number2 = int.parse(_number2Controller.text);

                print("good");

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        mainContainer(Result(number1, number2, _op!))));
              } on Exception {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Caution"),
                      content: Row(
                        children: [
                          Icon(
                            Icons.info,
                            color: Colors.black,
                          ),
                          Text(" You should enter numbers!!!"),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: Text("Calculate"),
          )
        ],
      ),
    );
  }
}
