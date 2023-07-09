import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:m216_mini_project_02/screens/home.dart';
import 'package:m216_mini_project_02/screens/main_conainer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'Modals/Operation.dart';

late List<Operation> operationsss;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();


  final database = openDatabase(
    join(await getDatabasesPath(), 'operations.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE operations(value TEXT PRIMARY KEY)',
      );
    },
    version: 1,
  );

  Future<void> insertOperation(Operation operation) async {
    final db = await database;

    await db.insert(
      'operations',
      operation.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  await insertOperation(Operation("+"));
  await insertOperation(Operation("-"));
  await insertOperation(Operation("*"));

  Future<List<Operation>> getAllOperations() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('operations');

    return List.generate(maps.length, (i) {
      return Operation(
        maps[i]['value'],
      );
    });
  }

  operationsss = await getAllOperations();
  print(operationsss);

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
      home: mainContainer(Home(fakerName,operationsss)),
    );
  }
}
