import 'package:flutter/material.dart';
import 'detail_objet.dart';

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

class TrucElement {
  late int id;
  late String name;
}

class _MyHomePageState extends State<MyHomePage> {

  List<TrucElement> listeTrucs = [
    TrucElement()
      ..id = 1
      ..name = 'Truc 1',
    TrucElement()
      ..id = 2
      ..name = 'Truc 2',
    TrucElement()
      ..id = 3
      ..name = 'Truc 3',
    TrucElement()
      ..id = 4
      ..name = 'Truc 4',
    TrucElement()
      ..id = 5
      ..name = 'Truc 5',
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
            itemCount: listeTrucs.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text('ID = ${listeTrucs[index].id}'),
                subtitle: Text('Nom = ${listeTrucs[index].name}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailObjet(
                      truc: listeTrucs[index])
                    ),
                  );
                },
              );
            },
          )
      )
    );
  }
}
