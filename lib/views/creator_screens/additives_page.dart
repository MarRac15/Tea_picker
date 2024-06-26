import 'package:flutter/material.dart';
import 'package:tea_picker/providers/additivesNotifier.dart';
import 'package:tea_picker/viewModels/teaViewModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdditivesPage extends ConsumerWidget {
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additives = ref.watch(additivesNotifierProvider);

    return Scaffold(
    appBar: AppBar(
        title: Text('Select your additives:', style: Theme.of(context).textTheme.displayLarge),
      ),
      body: ListView.builder(
        itemCount: additives.length,
        itemBuilder: ((context, index){
          final additive = additives[index];
          return CheckboxListTile(
            title: Text(additive.name, style: Theme.of(context).textTheme.bodyLarge),
            activeColor: Theme.of(context).colorScheme.secondary,
            checkColor: Theme.of(context).primaryColor,
            value: additive.isSelected,
            onChanged: (bool? value){
                ref.read(additivesNotifierProvider.notifier).toggleAdditiveSelection(additive);
             }
             );
        })
        )
    );
  }
}