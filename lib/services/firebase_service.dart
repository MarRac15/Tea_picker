import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tea_picker/models/tea.dart';

class FirebaseService{
  final CollectionReference teaCollection = FirebaseFirestore.instance.collection('teas');

  Future<void> saveTea(Tea tea) async{
    try{
      await teaCollection.add(tea.toMap());
    }
    catch(e){
      print('There were problems while saving your tea: $e');
      throw Exception('Failed to save the tea');
    }
    
  }

  Future<List<Tea>> fetchTeas() async{
    final querySnap = await teaCollection.get(); //oczekuje na wynik zapytania do teas
    return querySnap.docs.map((doc)=> Tea.fromMap(doc.data() as Map<String, dynamic>)).toList();
  } //kazdy element z docs konwertuje na obiekt Tea, twory liste obiektow
}