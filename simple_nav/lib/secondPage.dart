import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String text;

  const SecondPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seconde page')),
      body: Center(
        child: Text(
          'Texte reçu : $text',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}