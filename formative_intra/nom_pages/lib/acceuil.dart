import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AcceuilPage extends StatefulWidget {
  const AcceuilPage({super.key});

  @override
  State<AcceuilPage> createState() => _MyAcceuilPageState();
}

class _MyAcceuilPageState extends State<AcceuilPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Accueil'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue,
                    )
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.red,
                    ))
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                    )),
              ],
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child : Container(
                        color: Colors.yellow,
                        alignment: Alignment.center,
                      ),
                    )
                  ],
                ),
              )
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.orange,
                    )
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.pink,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}