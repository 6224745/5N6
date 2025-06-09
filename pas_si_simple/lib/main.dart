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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Demo!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Bloc rouge 2/3 largeur
            Container(
              width: largeur * 2 / 3,
              height: 200,
              color: Colors.red,
            ),
            // Bloc de droite 1/3 largeur
            Container(
              width: largeur / 3 - 16,
              height: 200,
              child: Row(
                children: [
                  // Colonne gauche : YO centré dans 100 de haut
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          color: Colors.white,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'YO',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Colonne droite : 2 rows blanc/noir
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          color: Colors.white,
                        ),
                        Container(
                          height: 100,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(padding:
      const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
            onPressed: () {},
            child: Text('Bouton du bas'),
        ),
      ),
      ),
    );
  }
}