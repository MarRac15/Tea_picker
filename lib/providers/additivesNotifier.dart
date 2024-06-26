import 'package:tea_picker/models/additive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_picker/viewModels/teaViewModel.dart';

class AdditivesNotifier extends StateNotifier<List<Additive>> {
  final TeaViewModel teaViewModel;

  AdditivesNotifier(this.teaViewModel): super(Additive.getAdditives());
  

  void toggleAdditiveSelection(Additive additive){
    state = [
      for (final item in state)
        if (item.name == additive.name)
          Additive(name: item.name, isSelected: !item.isSelected)
        else 
          item
    ];

    if (additive.isSelected){
      teaViewModel.addAdditive(additive.name);
    }
    else{
      teaViewModel.removeAdditive(additive.name);
    }
  }

  void initializeAdditives(List<String> additiveNames){
    state = additiveNames.map((name)=> Additive(name: name)).toList();
  }
} 


final additivesNotifierProvider = 
  StateNotifierProvider<AdditivesNotifier, List<Additive>>((ref){
    final teaViewModel = ref.read(teaProvider.notifier);
    return AdditivesNotifier(teaViewModel);
  });