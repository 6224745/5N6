import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          final isPortrait = orientation == Orientation.portrait;

          return Column(
            children: [
              Container(
                color: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                width: double.infinity,
                child: SafeArea(
                  child: Center(
                    child: Text(
                      'Super plein de tailles infinies!',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: isPortrait
                    ? Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/building.jpg',
                      fit: BoxFit.cover,
                    ),
                    Center(
                      child: SingleChildScrollView(
                        child: _buildLoginCard(context),
                      ),
                    ),
                  ],
                )
                    : Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                          child: _buildLoginCard(context)
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/building.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLoginCard(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 360 || screenSize.height < 600;

    return Card(
      color: Colors.black87,
      margin: EdgeInsets.all(isSmallScreen ? 8 : 16),
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
        width: screenSize.width > 450 ? 400 : screenSize.width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Mes voyages - Connexion',
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 20 : 24,
              ),
            ),
            SizedBox(height: isSmallScreen ? 16 : 24),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black54,
                hintText: 'Nom',
                prefixIcon: Icon(Icons.person, color: Colors.white),
                hintStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: isSmallScreen ? 12 : 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black54,
                hintText: 'Mot de passe',
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                hintStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: isSmallScreen ? 12 : 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                icon: Icon(Icons.arrow_forward),
                label: Text('Poursuivre'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
