import 'package:tea_picker/models/tea.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TeaViewModel extends StateNotifier<Tea> {

  TeaViewModel(): super(Tea(id: '', name: '', type: '', taste: '', mood: '', intensity: '', additives: []));

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
    final updatedAdditives = List<String>.from(state.additives)..add(additive);
    state = state.copyWith(additives: updatedAdditives);
  }

  void removeAdditive(String additive){
    final updatedAdditives = List<String>.from(state.additives)..remove(additive);
    state = state.copyWith(additives: updatedAdditives);
  }

  void reset(){
    state = Tea(id: '', name: '', type: '', taste: '', mood: '', intensity: '', additives: []);
  }

}

final teaProvider = StateNotifierProvider<TeaViewModel, Tea>((ref){
    return TeaViewModel();
  });