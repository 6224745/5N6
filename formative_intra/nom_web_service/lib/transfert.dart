import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';
part 'transfert.g.dart';

@JsonSerializable()
class Animal {
  Animal();

  String nom = '';
  String espece = '';
  String famille = '';
  String continent = '';

  factory Animal.fromJson(Map<String, dynamic> json) =>
      _$AnimalFromJson(json);

  Map<String, dynamic> toJson() => _$AnimalToJson(this);
}