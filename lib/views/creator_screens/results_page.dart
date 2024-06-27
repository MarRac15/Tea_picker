import 'package:flutter/material.dart';
import 'package:tea_picker/services/firebase_service.dart';
import 'package:tea_picker/viewModels/teaViewModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_picker/views/catalog_page.dart';
import 'package:tea_picker/views/creator_screens/taste_page.dart';

class ResultsPage extends ConsumerWidget {


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final tea = ref.watch(teaProvider);
    final teaViewModel = ref.watch(teaProvider.notifier);
    final firebase = FirebaseService();
    final TextEditingController _nameController = TextEditingController(text: tea.name);
    
    return Scaffold(
    appBar: AppBar(
        title: Text('Your perfect tea:', style: Theme.of(context).textTheme.displayLarge),
      ),

      resizeToAvoidBottomInset: true,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Your tea name',
                  ),
                  onChanged: (value){
                    teaViewModel.setName(value);
                  },
                ),
          
                SizedBox(height: 20,),
          
                Text('Type: ${tea.type}', style: Theme.of(context).textTheme.bodyLarge),
                Text('Taste: ${tea.taste}', style: Theme.of(context).textTheme.bodyLarge),
                Text('Mood: ${tea.mood}', style: Theme.of(context).textTheme.bodyLarge),
                Text('Intensity: ${tea.intensity}', style: Theme.of(context).textTheme.bodyLarge),
                Text('Additives: ', style: Theme.of(context).textTheme.bodyLarge),
                ...TeaViewModel.buildAdditivesList(tea.additives, Theme.of(context).textTheme.bodyLarge!),
          
                SizedBox(height: 40,),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     ElevatedButton(
                       style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        ),
                        onPressed: () async{
        
                          await firebase.saveTea(tea);
                          teaViewModel.reset();
                          _nameController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Tea saved successfully! See it in your catalog')),
                          );
                        }, 
                        child: Text('Save your Tea', style: Theme.of(context).textTheme.bodyLarge)
                        ),
        
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      ),
                      onPressed: () async{
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogPage()));
                      }, 
                      child: Text('Back to your catalog', style: Theme.of(context).textTheme.bodyLarge)
                      ),
        
                ],
                )
          
               
              ]
              ),
          
          ),
        ),
      )
    );
  }
}