import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  final ImagePicker _picker = ImagePicker();
  List<String> _imagePaths = [];
  List<String> _imageUrls = [];
  bool _isUploading = false;

  Future<void> getImages() async {
    final List<XFile>? pickedImages = await _picker.pickMultiImage();
    if (pickedImages != null && pickedImages.isNotEmpty) {
      setState(() {
        _imagePaths = pickedImages.map((image) => image.path).toList();
      });
    }
  }

  Future<void> sendImages() async {
    if (_imagePaths.isEmpty) return;

    setState(() {
      _isUploading = true;
      _imageUrls.clear();
    });

    Dio dio = Dio();

    for (String path in _imagePaths) {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(path), // Changé de 'image' à 'file'
      });

      try {
        Response response = await dio.post(
          'http://10.0.2.2:8080/exos/file',
          data: formData,
        );

        if (response.statusCode == 200) {
          // La réponse est l'ID de l'image sous forme de texte
          String imageId = response.data.toString();
          // Construction de l'URL pour afficher l'image
          String imageUrl = 'http://10.0.2.2:8080/exos/file/$imageId';

          setState(() {
            _imageUrls.add(imageUrl);
          });
        }
      } catch (e) {
        print('Erreur lors de l\'envoi de l\'image: $e');
      }
    }

    setState(() {
      _isUploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: getImages,
                  child: const Text('Sélectionner des images'),
                ),
                ElevatedButton(
                  onPressed: _imagePaths.isEmpty || _isUploading ? null : sendImages,
                  child: const Text('Envoyer les images'),
                ),
              ],
            ),
          ),
          if (_isUploading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          if (_imagePaths.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${_imagePaths.length} image(s) sélectionnée(s)'),
            ),
          Expanded(
            child: _imageUrls.isEmpty
                ? const Center(child: Text('Aucune image envoyée'))
                : ListView.builder(
              itemCount: _imageUrls.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(_imageUrls[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}