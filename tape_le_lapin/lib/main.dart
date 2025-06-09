import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _indexlapin = Random().nextInt(4);

  int _flops = 0;
  int _pafs = 0;

  void gererTape(int index) {
    print('Bouton ' + index.toString());
    if (this._indexlapin == index) {
      this._pafs++;
      _indexlapin = Random().nextInt(4);
    }
    else{
      this._flops++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var b0 = MaterialButton(
      onPressed: () {
        gererTape(0);
      },
      child: Text(this._indexlapin == 0 ? 'Lapin' : 'Taupe'),
    );
    var b1 = MaterialButton(
      onPressed: () {
        gererTape(1);
      },
      child: Text(this._indexlapin == 1 ? 'Lapin' : 'Taupe'),
    );
    var b2 = MaterialButton(
      onPressed: () {
        gererTape(2);
      },
      child: Text(this._indexlapin == 2 ? 'Lapin' : 'Taupe'),
    );
    var b3 = MaterialButton(
      onPressed: () {
        gererTape(3);
      },
      child: Text(this._indexlapin == 3 ? 'Lapin' : 'Taupe'),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tape le lapin"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                    "Pafs: " + this._pafs.toString(),
                    style: TextStyle(color: Colors.green, fontSize: 20)
                ),
                Text(
                    "Flops: " + this._flops.toString(),
                    style: TextStyle(color: Colors.red, fontSize: 20)
                )
              ],
            ),
            Text(
                'Tape le lapin',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900)
            ),
            Text(
              '$_indexlapin',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                b0,
                b1
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                b2,
                b3
              ],
            ),
          ],
        ),
      ),
    );
  }
}
