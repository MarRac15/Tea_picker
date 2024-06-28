import 'package:flutter/material.dart';
import 'package:tea_picker/models/additive.dart';
import 'package:tea_picker/models/tea.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_picker/services/firebase_service.dart';

class TeaViewModel extends StateNotifier<Tea> {
  final FirebaseService firebase;

  TeaViewModel(this.firebase): super(Tea(id: '', name: '', type: '', taste: '', mood: '', intensity: '', additives: [], brewingDate: null, brewingTime: 0, brewingTemp: 0));

//settery:

  void setName(String name){
    state = state.copyWith(name: name);
  }

  void setType(String type){
    state = state.copyWith(type: type);
    updateBrewingTemp();
  }

  void setTaste(String taste){
    state = state.copyWith(taste: taste);
  }
  
  void setMood(String mood){
    state = state.copyWith(mood: mood);
  }

  void setIntensity(String intensity){
    state = state.copyWith(intensity: intensity);
    updateBrewingTime();
  }


//metody dla dodatkow:

  void addAdditive(String additive){
    // final updatedAdditives = List<String>.from(state.additives)..add(additive);
    state = state.copyWith(additives: [...state.additives, additive]);
  }

  void removeAdditive(String additive){
    final updatedAdditives = List<String>.from(state.additives)..remove(additive);
    state = state.copyWith(additives: updatedAdditives);
  }

  bool isAdditiveSelected(String additive){
    return state.additives.contains(additive);
  }

  void toggleAdditive(String additive) {
    final updatedAdditives = List<String>.from(state.additives);
    if (updatedAdditives.contains(additive)) {
      removeAdditive(additive);
    } else {
      addAdditive(additive);
    }
  }

   static List<Widget> buildAdditivesList(List<String> additives, TextStyle textStyle) {
    return additives.map((additive) => Text('- $additive', style: textStyle)).toList();
  }

  void reset(){
    state = Tea(id: '', name: '', type: '', taste: '', mood: '', intensity: '', additives: [], brewingDate: null, brewingTime: 0, brewingTemp: 0);
  }

//system regułowy do temperatury i czasu zaparzania:

void updateBrewingTime(){
  switch(state.intensity){
    case 'strong':
      state = state.copyWith(brewingTime: 5);
      break;
    case 'medium':
      state = state.copyWith(brewingTime: 3);
      break;
    case 'mild':
      state = state.copyWith(brewingTime: 2);
      break;
    default:
      state = state.copyWith(brewingTime: 0);
  }
}

void updateBrewingTemp(){
  state = state.copyWith(brewingTemp: 95);

  if (state.type=='black'){
    state = state.copyWith(brewingTemp: 100);
  }
  if (state.type == 'green'){
    state = state.copyWith(brewingTemp: 85);
  }
  if (state.type=='white'){
    state = state.copyWith(brewingTemp: 90);
  }
}

//wyywolaj przy zaparzaniu:

void brewTea(){
  state = state.copyWith(brewingDate: DateTime.now());
}


//funkcje do bazy danych

  Future<void> saveTea() async{
    await firebase.saveTea(state);
  }

  Future<void>deleteTea() async{
    await firebase.deleteTea(state.id);
  }

}

//provider:
final teaProvider = StateNotifierProvider<TeaViewModel, Tea>((ref){
    return TeaViewModel(FirebaseService());
  });