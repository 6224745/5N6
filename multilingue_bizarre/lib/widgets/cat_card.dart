import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class CatCard extends StatelessWidget {
  final String image;
  final String labelKey;

  const CatCard({required this.image, required this.labelKey});

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    String translatedLabel;
    switch (labelKey) {
      case 'dragonCat':
        translatedLabel = tr.dragonCat;
        break;
      case 'coneCat':
        translatedLabel = tr.coneCat;
        break;
      case 'weirdCat':
        translatedLabel = tr.weirdCat;
        break;
      case 'warCat':
        translatedLabel = tr.warCat;
        break;
      default:
        translatedLabel = labelKey;
    }

    return Card(
      child: Column(
        children: [
          Expanded(child: Image.asset(image, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(translatedLabel),
          ),
        ],
      ),
    );
  }
}
