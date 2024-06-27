class Additive {
  final String name;
  bool isSelected;

  Additive({required this.name, this.isSelected = false});

  static List<Additive> getAdditives(){
  List<Additive>additives = [];

  additives.add(
    Additive(name: 'mint',
    isSelected: false
    ));
  additives.add(
    Additive(name: 'orange peel',
    isSelected: false
    ));
  additives.add(
    Additive(name: 'honey',
    isSelected: false
    ));
  additives.add(
    Additive(name: 'cinamonn roll',
    isSelected: false
    ));
  additives.add(
    Additive(name: 'lemon',
    isSelected: false
    ));

  return additives;
  }

  Additive copyWith({
    String? name,
    bool? isSelected,
  }) {
    return Additive(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'isSelected': isSelected
    };
  }

  static Additive fromMap(Map<String, dynamic> map){
    return Additive(
      name: map['name'],
      isSelected: map['isSelected'],
      );
  }
}