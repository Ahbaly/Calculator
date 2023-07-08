import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:m216_mini_project_02/screens/home.dart';
import 'package:m216_mini_project_02/screens/main_conainer.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var faker = new Faker();
    String fakerName = faker.person.name();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainContainer(Home(fakerName)),
    );
  }
}
