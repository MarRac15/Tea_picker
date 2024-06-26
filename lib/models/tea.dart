class Tea{
  final String id;
  final String name;
  final String type;
  final String taste;
  final String mood;
  final String intensity;
  final List<String> additives;


Tea({
  required this.id,
  required this.name,
  required this.type,
  required this.taste,
  required this.mood,
  required this.intensity,
  required this.additives
  });

  Tea copyWith({
    String? id,
    String? name,
    String? type,
    String? taste,
    String? mood,
    String? intensity,
    List<String>? additives})
  {
    return Tea(
      id: id ?? this.id, 
      name: name ?? this.name, 
      type: type ?? this.type, 
      taste: taste ?? this.taste, 
      mood: mood?? this.mood, 
      intensity: intensity?? this.intensity, 
      additives: additives?? this.additives);
  }
}