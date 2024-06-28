import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tea_picker/models/additive.dart';

class Tea{
  final String id;
  final String name;
  final String type;
  final String taste;
  final String mood;
  final String intensity;
  final List<String> additives;
  final DateTime? brewingDate;
  final int brewingTime;
  final int brewingTemp;



Tea({
  this.id = '',
  required this.name,
  required this.type,
  required this.taste,
  required this.mood,
  required this.intensity,
  required this.additives,
  required this.brewingDate,
  required this.brewingTemp,
  required this.brewingTime
  });

  Tea copyWith({
    String? id,
    String? name,
    String? type,
    String? taste,
    String? mood,
    String? intensity,
    List<String>? additives,
    DateTime? brewingDate,
    int? brewingTime,
    int? brewingTemp})
  {
    return Tea(
      id: id ?? this.id,
      name: name ?? this.name, 
      type: type ?? this.type, 
      taste: taste ?? this.taste, 
      mood: mood?? this.mood, 
      intensity: intensity?? this.intensity, 
      additives: additives?? this.additives,
      brewingDate: brewingDate?? this.brewingDate,
      brewingTime: brewingTime?? this.brewingTime,
      brewingTemp: brewingTemp?? this.brewingTemp);
  }

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'name': name,
      'type': type,
      'taste': taste,
      'mood': mood,
      'intensity': intensity,
      'additives': additives,
      'brewingDate': null,
      'brewingTime': brewingTime,
      'brewingTemp': brewingTemp
    };
  }

    static Tea fromMap(Map<String, dynamic> map) {
    return Tea(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      taste: map['taste'] ?? '',
      mood: map['mood'] ?? '',
      intensity: map['intensity'] ?? '',
      additives: List<String>.from(map['additives'] ?? []),
      brewingDate: (map['brewingDate'] as Timestamp?)?.toDate(),
      brewingTime: map['brewingTime'] ?? 0,
      brewingTemp: map['brewingTemp'] ?? 0
    );
  }
}