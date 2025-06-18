import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/cat.dart';

class chat_affiche extends StatelessWidget {
  const chat_affiche({
    super.key,
    required List<Cat> cats,
  }) : _cats = cats;

  final List<Cat> _cats;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              title: Text(_cats[0].name),
              subtitle: Text(
                _cats[0].description,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Image.network(_cats[0].image),
          ],
        ),
      ),
    );
  }
}