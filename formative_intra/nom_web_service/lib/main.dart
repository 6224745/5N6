import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nom_web_service/transfert.dart';

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
      home: const MyHomePage(title: 'Les animaux de mon zoo'),
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
  final TextEditingController _continentController = TextEditingController();
  final TextEditingController _familleController = TextEditingController();
  List<Animal> _animaux = [];
  bool _isLoading = false;

  @override
  void dispose() {
    _continentController.dispose();
    _familleController.dispose();
    super.dispose();
  }

  Future<void> _rechercherAnimaux() async {
    setState(() {
      _isLoading = true;
    });

    String continent = _continentController.text.trim().isEmpty
        ? 'monde'
        : _continentController.text.trim().toLowerCase();

    String famille = _familleController.text.trim();

    String url = 'http://10.0.2.2:8080/exam/animaux/$continent';
    if (famille.isNotEmpty) {
      url += '?famille=$famille';
    }
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        setState(() {
          _animaux = jsonData.map((json) => Animal.fromJson(json)).toList();
        });
        print('Animaux récupérés: ${_animaux.length}');
      } else {
        print('Erreur: ${response.statusCode}');
        setState(() {
          _animaux = [];
        });
      }
    } catch (e) {
      print('Exception: $e');
      setState(() {
        _animaux = [];
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _continentController,
                    decoration: const InputDecoration(
                      labelText: 'Continent (laissez vide pour "monde")',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _familleController,
                    decoration: const InputDecoration(
                      labelText: 'Famille (optionnel)',
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _rechercherAnimaux,
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Rechercher'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _animaux.isEmpty
                  ? const Center(child: Text('Aucun animal trouvé'))
                  : ListView.builder(
                itemCount: _animaux.length,
                itemBuilder: (context, index) {
                  final animal = _animaux[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          animal.continent.toLowerCase() == 'océans' ||
                              animal.continent.toLowerCase() == 'oceans'
                              ? Icons.water
                              : Icons.landscape,
                          size: 24,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                animal.nom,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(animal.espece),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
