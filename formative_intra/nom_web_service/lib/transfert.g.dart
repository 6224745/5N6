part of 'transfert.dart';

Animal _$AnimalFromJson(Map<String, dynamic> json) =>
    Animal()
      ..nom = json['nom'] as String
      ..espece = json['espece'] as String
      ..famille = json['famille'] as String
      ..continent = json['continent'] as String;

Map<String, dynamic> _$AnimalToJson(Animal instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'espece': instance.espece,
      'famille': instance.famille,
      'continent': instance.continent,
    };