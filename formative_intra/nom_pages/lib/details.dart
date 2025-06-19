import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Désactive la flèche de retour
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
              child: Container(
                height: 200,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/acceuil');
              },
              child: Text('Retour à l\'accueil'),
            ),
          ],
        ),
      ),
    );
  }
}