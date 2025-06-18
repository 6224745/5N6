import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/cat.dart';
import '../widgets/chat_affiche.dart';

class listView extends StatelessWidget {
  const listView({
    super.key,
    required List<Cat> cats,
  }) : _cats = cats;

  final List<Cat> _cats;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text(
          "Ma collection de chats",
          style: TextStyle(fontSize:32.0,
              color: Color(0xFF204f4f),
              fontWeight: FontWeight.w600,
              fontFamily: "Roboto"),
        ),
        Row(
          children: [
            Expanded(
              child: chat_affiche(cats: _cats),
            ),
            Expanded(
              child: SizedBox(
                height: 220,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(_cats[1].name),
                        subtitle: Text(
                          _cats[1].description,
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Image.network(_cats[1].image),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 220,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(_cats[2].name),
                        subtitle: Text(
                          _cats[2].description,
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Image.network(_cats[2].image),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 220,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(_cats[3].name),
                        subtitle: Text(
                          _cats[3].description,
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Image.network(_cats[3].image),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 220,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(_cats[4].name),
                        subtitle: Text(
                          _cats[4].description,
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Image.network(_cats[4].image),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 220,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(_cats[5].name),
                        subtitle: Text(
                          _cats[5].description,
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Image.network(_cats[5].image),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}