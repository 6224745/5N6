import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Firestore Exemple'),
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
  // Matricule de l'étudiant (à remplacer par votre propre matricule)
  final TextEditingController matricule = TextEditingController();

  // Variables pour stocker les informSations récupérées
  String nom = "";
  String prenom = "";
  String complete = ""; // Ajout d'une variable pour stocker l'état de "complete"

  // Référence à la collection Firestore
  final CollectionReference etudiantsCollection =
      FirebaseFirestore.instance.collection('etudiants');

  // Fonction pour obtenir les données de l'étudiant
  Future<void> obtenirDonnees() async {
    try {
      // Récupérer le document avec l'ID correspondant au matricule
      DocumentSnapshot document = await etudiantsCollection.doc(matricule.text).get();

      if (document.exists) {
        // Conversion des données en Map pour pouvoir y accéder
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        // Mise à jour de l'état avec les nouvelles données
        setState(() {
          nom = data['nom'] ?? "";
          prenom = data['prenom'] ?? "";
          complete = (data['complete'] != null) ? data['complete'].toString() : "";
        });
      } else {
        setState(() {
          nom = "Document non trouvé";
          prenom = "Document non trouvé";
          complete = "non trouvé";
        });
      }
    } catch (e) {
      setState(() {
        nom = "Erreur: ${e.toString()}";
        prenom = "Erreur lors de la récupération";
        complete = "erreur";
      });
    }
  }

  // Fonction pour mettre à jour le statut "complete" à true
  Future<void> mettreAJour() async {
    try {
      await etudiantsCollection.doc(matricule.text).update({'complete': true});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mise à jour réussie')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur de mise à jour: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Entrez votre matricule',
              ),
              controller: matricule,
            ),
            // Boutons pour interagir avec Firestore
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: obtenirDonnees,
                  child: const Text('Obtenir'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: mettreAJour,
                  child: const Text('Mettre à jour'),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Affichage des informations récupérées
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Text('Nom: $nom', style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text('Prénom: $prenom', style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text('Complète: $complete', style: const TextStyle(fontSize: 18)), // Affichage de l'état "complete"
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
