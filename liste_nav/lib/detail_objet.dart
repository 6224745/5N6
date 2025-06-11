import 'package:flutter/material.dart';
import 'main.dart';

class DetailObjet extends StatefulWidget {
  const DetailObjet({super.key, required this.truc});

  final TrucElement truc;

  @override
  State<DetailObjet> createState() => _DetailObjetState();
}

class _DetailObjetState extends State<DetailObjet> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ID = ${widget.truc.id}',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Nom = ${widget.truc.name}',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}