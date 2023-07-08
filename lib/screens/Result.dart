import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  late int _nbr1;
  late int _nbr2;
  late String _op;
  late String _resultMsg;
  late int _result;

  Result(int nbr1, int nbr2, String op) {
    _nbr1 = nbr1;
    _nbr2 = nbr2;
    _op = op;

    if (_op == "+")
      _result = _nbr1 + _nbr2;
    else if (_op == "_")
      _result = _nbr1 - _nbr2;
    else if (_op == "*")
      _result = _nbr1 * _nbr2;
    else {
      _resultMsg = "Invalid input !!!";
      return;
    }

    _resultMsg = "$_nbr1 $_op $_nbr2 = $_result";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue.shade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calculate,
            size: 80,
            color: Colors.black54,
          ),
          Text(
            _resultMsg,
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 35,
            ),
          )
        ],
      ),
    );
  }
}
