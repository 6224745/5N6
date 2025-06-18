import 'package:flutter/material.dart';
import 'package:organisation/widgets/drawer.dart';
import '../method/ListView.dart';
import '../models/cat.dart';
import 'package:organisation/method/banniere_du_haut.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  final List<Cat> _cats = [
    Cat(id:1, name: "Lion Tiger", description: "Imposant et dangereux félin" ,image: "https://animalcarecentersmyrna.com/wp-content/uploads/2020/11/interesting-facts-cats.jpeg"),
    Cat(id:2, name: "Stiv", description: "Diva et dramatique" ,image: "https://media.istockphoto.com/id/1281804798/photo/very-closeup-view-of-amazing-domestic-pet-in-mirror-round-fashion-sunglasses-is-isolated-on.webp?b=1&s=170667a&w=0&k=20&c=4CLWHzcFeku9olx0np2htie2cOdxWamO-6lJc-Co8Vc="),
    Cat(id:3, name: "Alexandre", description: "Perdu" ,image: "https://media.istockphoto.com/id/1372144730/photo/cool-fluffy-cat-wearing-sunglasses-looking-up-at-copy-space-portrait-on-red-background.jpg?s=612x612&w=0&k=20&c=Ca_RjsBxYzyLNfBhn-7U-GfIUS3aJse3Ar77sJHohGo="),
    Cat(id:4, name: "Lionnel", description: "Roi du disco" ,image: "https://media.istockphoto.com/id/1171193130/video/portrait-of-disco-furry-cat-in-fashion-eyeglasses-on-studio-neon-shining-wall-luxurious.jpg?s=640x640&k=20&c=_tYNhxEeqxNGtRL5H7AjODDwDVCw1xND8nFMM8owluc="),
    Cat(id:5, name: "Sa Majesté Fluffy Mcfluff", description: "Trop cool" ,image: "https://media.istockphoto.com/id/1227017125/photo/cool-cat-sunglasses.webp?b=1&s=170667a&w=0&k=20&c=2U0SEf5HqsXYAYVsdctTqH2h5gBxWfsLYu7VcNgOxN8="),
    Cat(id:6, name: "Caramel", description: "Chill et relax" ,image: "https://static.vecteezy.com/system/resources/thumbnails/022/678/486/small_2x/funny-studio-shot-of-cool-cat-wearing-sunglasses-on-yellow-background-with-copy-space-generative-ai-photo.jpg"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: const Text("Extraire les widgets"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const drawer(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(0.0),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.0, 0.7),
                end: Alignment(0.9, -0.1),
                colors: [
                  Color(0xFFffffff),
                  Color(0xFF266669),
                  Color(0xFF6e8f92),
                ],
                stops: [
                  0.1,
                  1.0,
                  0.5,
                ],
              ),
            ),
          ),
          Column(
            children: [
              banniere_du_haut(),
              Expanded(
                child: listView(cats: _cats),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        child: const Icon(Icons.add),
      ),
    );
  }
}