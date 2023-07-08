import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();

}

class _CalculatorState extends State<Calculator> {
  late String? _op = "+";


  @override
  Widget build(BuildContext context) {
    // String? op = "+";

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
            decoration: InputDecoration(hintText: "First number"),
          ),

          RadioListTile(
            title: Text("+"),
            value: "+",
            groupValue: _op,
            onChanged: (value){
              setState(() {
                _op = value.toString();
                print(_op);
              });
            },
          ),

          RadioListTile(
            title: Text("-"),
            value: "-",
            groupValue: _op,
            onChanged: (value){
              setState(() {
                _op = value.toString();
                print(_op);

              });
            },
          ),

          RadioListTile(
            title: Text("*"),
            value: "*",
            groupValue: _op,
            onChanged: (value){
              setState(() {
                _op = value.toString();
                print(_op);

              });
            },
          ),

          TextField(
            decoration: InputDecoration(hintText: "Second number"),

          ),

          ElevatedButton(
            onPressed: () {
            },
            child: Text("Calculate"),
          )
        ],
      ),
    );
  }
}
