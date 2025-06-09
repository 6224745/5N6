import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.red,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.green,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.orange,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.purple,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.yellow,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.cyan,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.pink,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.teal,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}