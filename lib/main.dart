import 'package:flutter/material.dart';
import 'package:tasks/sql_db.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SqlDb(),
    );
  }
}
class D extends StatelessWidget {
  const D({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}