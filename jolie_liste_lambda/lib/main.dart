import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suite de Fibonacci',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(title: 'Suite de Fibonacci'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  // Getter qui génère la suite de Fibonacci avec une expression lambda
  List<int> get fibo {
    final list = List<int>.generate(10, (i) => i < 2 ? i : 0);
    for (int i = 2; i < list.length; i++) {
      list[i] = list[i - 1] + list[i - 2];
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: fibo.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: Colors.deepPurple.shade200,
                    width: 2,
                  ),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'F($index) = ${fibo[index]}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}