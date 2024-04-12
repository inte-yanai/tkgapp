import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // void _addFirebase() async {
  //   final db = FirebaseFirestore.instance;
  //   final stringA = await rootBundle.loadString("assets/product.csv");
  //   final splitter = LineSplitter();
  //   final lines = splitter.convert(stringA);
  //   for (var i = 0; i < lines.length; i++) {
  //     final row = lines[i].split(',');

  //     final product = <String, dynamic>{
  //       "shohin_code": row[0].toString(),
  //       "shohin_kataban": row[1].toString(),
  //       "shohin_name": row[2].toString(),
  //       "shohin_bunrui": int.parse(row[3]),
  //       "shohin_kbn": int.parse(row[4])
  //     };
  //     db.collection("products").doc(row[0]).set(product);
  //   }
  // }

  void _addFirebase() async {
    final db = FirebaseFirestore.instance;
    final stringA = await rootBundle.loadString("assets/branch.csv");
    const splitter = LineSplitter();
    final lines = splitter.convert(stringA);
    for (var i = 0; i < lines.length; i++) {
      final row = lines[i].split(',');

      final branch = <String, dynamic>{
        "shiten_code": int.parse(row[0]),
        "shiten_name": row[1].toString()
      };
      db.collection("branches").doc(row[0]).set(branch);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("sample"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addFirebase,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
