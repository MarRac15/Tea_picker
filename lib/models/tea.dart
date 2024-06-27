import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tea_picker/models/additive.dart';

class Tea{
  final String name;
  final String type;
  final String taste;
  final String mood;
  final String intensity;
  final List<String> additives;
  final DateTime? brewingDate;


Tea({
  required this.name,
  required this.type,
  required this.taste,
  required this.mood,
  required this.intensity,
  required this.additives,
  required this.brewingDate
  });

  Tea copyWith({
    String? name,
    String? type,
    String? taste,
    String? mood,
    String? intensity,
    List<String>? additives,
    DateTime? brewingDate})
  {
    return Tea(
      name: name ?? this.name, 
      type: type ?? this.type, 
      taste: taste ?? this.taste, 
      mood: mood?? this.mood, 
      intensity: intensity?? this.intensity, 
      additives: additives?? this.additives,
      brewingDate: brewingDate?? this.brewingDate);
  }

  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'type': type,
      'taste': taste,
      'mood': mood,
      'intensity': intensity,
      'additives': additives,
      'brewingDate': brewingDate != null ? Timestamp.fromDate(brewingDate!) : null
    };
  }

    static Tea fromMap(Map<String, dynamic> map) {
    return Tea(
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      taste: map['taste'] ?? '',
      mood: map['mood'] ?? '',
      intensity: map['intensity'] ?? '',
      additives: List<String>.from(map['additives'] ?? []),
      brewingDate: (map['brewingDate'] as Timestamp?)?.toDate()
    );
  }
}