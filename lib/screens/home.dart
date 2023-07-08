import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                    "fullname",
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
              print("Go button clicked");
            },
            child: Text("Go"),
          )
        ],
      ),
    );
  }
}
