import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'details.dart';
import 'acceuil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formatif',
      initialRoute: '/acceuil',
      routes: {
        '/acceuil': (context) => const AcceuilPage(),
        '/details': (context) => const DetailPage(),
      },
    );
  }
}