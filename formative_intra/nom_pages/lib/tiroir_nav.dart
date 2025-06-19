import 'package:flutter/material.dart';
import 'details.dart';

class LeTiroir extends StatefulWidget {
  const LeTiroir({super.key});

  @override
  State<LeTiroir> createState() => LeTiroirState();
}

class LeTiroirState extends State<LeTiroir> {
  @override
  Widget build(BuildContext context) {
    var listView = ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gerard Ballestero Vidal', // Remplacez par VOTRE prénom
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              Text(
                '6224745', // Remplacez par VOTRE matricule
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.abc),
          title: const Text("Details"),
          onTap: () {
            // Ferme le tiroir de navigation
            Navigator.of(context).pop();
            // Navigue vers la page de détails
            Navigator.pushNamed(context, '/details');
          },
        ),
      ],
    );

    return Drawer(
      child: Container(
        color: const Color(0xFFFFFFFF),
        child: listView,
      ),
    );
  }
}
