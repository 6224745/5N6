import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {

  final String text;

  const SecondPage({super.key, required this.text});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Seconde page')
      ),
      body: Center(
        child: Text(
          'Texte reçu : ${widget.text}',
          style: const TextStyle(fontSize: 24),
        )
      ),
    );
  }
}