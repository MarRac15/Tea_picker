import 'package:flutter/material.dart';
import 'package:tea_picker/models/additive.dart';
import 'package:tea_picker/models/tea.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_picker/services/firebase_service.dart';

class TeaViewModel extends StateNotifier<Tea> {
  final FirebaseService firebase;

  TeaViewModel(this.firebase): super(Tea(name: '', type: '', taste: '', mood: '', intensity: '', additives: [], brewingDate: DateTime.now()));

  void setName(String name){
    state = state.copyWith(name: name);
  }

  void setType(String type){
    state = state.copyWith(type: type);
  }

  void setTaste(String taste){
    state = state.copyWith(taste: taste);
  }
  
  void setMood(String mood){
    state = state.copyWith(mood: mood);
  }

  void setIntensity(String intensity){
    state = state.copyWith(intensity: intensity);
  }

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
    state = Tea(name: '', type: '', taste: '', mood: '', intensity: '', additives: [], brewingDate: DateTime.now());
  }

  Future<void> saveTea() async{
    await firebase.saveTea(state);
  }

}

final teaProvider = StateNotifierProvider<TeaViewModel, Tea>((ref){
    return TeaViewModel(FirebaseService());
  });