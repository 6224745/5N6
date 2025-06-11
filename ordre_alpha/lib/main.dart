import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liste Mélangée',
      home: const MyHomePage(),
    );
  }
}

class Element {
  int id;
  String name;
  Element({required this.id, required this.name});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> prenoms = ['Max', 'Tom', 'Anna', 'Axel', 'Clara'];
  late List<Element> listeNoms;
  final Random rand = Random();

  @override
  void initState() {
    super.initState();
    _melangerListe();
  }

  void _melangerListe() {
    final nomsMelanges = List<String>.from(prenoms)..shuffle(rand);
    listeNoms = List.generate(
      nomsMelanges.length,
          (i) => Element(id: i + 1, name: nomsMelanges[i]),
    );
    setState(() {});
  }

  bool _estTriee() {
    for (int i = 0; i < listeNoms.length; i++) {
      if (listeNoms[i].name != prenoms[i]) return false;
    }
    return true;
  }

  void _echanger(int i, int j) {
    final tmp = listeNoms[i];
    listeNoms[i] = listeNoms[j];
    listeNoms[j] = tmp;
    setState(() {
      if (_estTriee()) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Bravo !'),
            content: const Text('La liste est dans l\'ordre.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _melangerListe();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liste Mélangée')),
      body: ListView.builder(
        itemCount: listeNoms.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listeNoms[index].name),
            leading: MaterialButton(
              child: Text('Monter'),
              onPressed: index > 0
                  ? () => _echanger(index, index - 1)
                  : null,
            ),
            trailing: MaterialButton(
              child: Text('Descendre'),
              onPressed: index < listeNoms.length - 1
                  ? () => _echanger(index, index + 1)
                  : null,
            ),
          );
        },
      ),
    );
  }
}