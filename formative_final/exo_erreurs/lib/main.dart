import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Division App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DivisionPage(title: 'Calculateur de Division'),
    );
  }
}

class DivisionPage extends StatefulWidget {
  const DivisionPage({super.key, required this.title});

  final String title;

  @override
  State<DivisionPage> createState() => _DivisionPageState();
}

class _DivisionPageState extends State<DivisionPage> {
  final TextEditingController _dividendeController = TextEditingController();
  final TextEditingController _diviseurController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _effectuerDivision() async {
    if (_formKey.currentState!.validate()) {
      String dividende = _dividendeController.text;
      String diviseur = _diviseurController.text;
      String url = 'https://examen-final-a24.azurewebsites.net/Exam2024/Division/$dividende/$diviseur';

      try {
        final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          // Si la requête a réussi
          Map<String, dynamic> data = jsonDecode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Résultat de la division: ${data['resultat']}'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          // Si le serveur répond avec une erreur
          String errorMessage;
          try {
            errorMessage = response.body;
          } catch (e) {
            errorMessage = 'Erreur du serveur (code ${response.statusCode})';
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erreur: $errorMessage'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        // Si l'application ne peut pas communiquer avec le serveur
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Impossible de communiquer avec le serveur. Veuillez vérifier votre connexion internet.'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _dividendeController.dispose();
    _diviseurController.dispose();
    super.dispose();
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _dividendeController,
                decoration: const InputDecoration(
                  labelText: 'Dividende',
                  hintText: 'Entrez le dividende',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un dividende';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Veuillez entrer un nombre entier valide';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _diviseurController,
                decoration: const InputDecoration(
                  labelText: 'Diviseur',
                  hintText: 'Entrez le diviseur',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un diviseur';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Veuillez entrer un nombre entier valide';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _effectuerDivision,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Effectuer la division',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
