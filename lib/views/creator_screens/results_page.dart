import 'package:flutter/material.dart';
import 'package:tea_picker/services/firebase_service.dart';
import 'package:tea_picker/viewModels/teaViewModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_picker/views/catalog_page.dart';
import 'package:tea_picker/views/creator_screens/taste_page.dart';
import 'package:tea_picker/views/home_page.dart';

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter name for your tea',
                  ),
                  onChanged: (value){
                    teaViewModel.setName(value);
                  },
                ),
          
                SizedBox(height: 20,),
          
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8.0)
                    ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Type: ',
                           style: Theme.of(context).textTheme.displayLarge,
                           children: <TextSpan>[
                            TextSpan(text: '         ${tea.type}', style: Theme.of(context).textTheme.bodyLarge)
                           ]
                      )),
                      RichText(
                        text: TextSpan(
                          text: 'Taste: ',
                           style: Theme.of(context).textTheme.displayLarge,
                           children: <TextSpan>[
                            TextSpan(text: '        ${tea.taste}', style: Theme.of(context).textTheme.bodyLarge)
                           ]
                      )),
                      RichText(
                        text: TextSpan(
                          text: 'Mood: ',
                           style: Theme.of(context).textTheme.displayLarge,
                           children: <TextSpan>[
                            TextSpan(text: '        ${tea.mood}', style: Theme.of(context).textTheme.bodyLarge)
                           ]
                      )),
                      RichText(
                        text: TextSpan(
                          text: 'Intensity: ',
                           style: Theme.of(context).textTheme.displayLarge,
                           children: <TextSpan>[
                            TextSpan(text: '  ${tea.intensity}', style: Theme.of(context).textTheme.bodyLarge)
                           ]
                      )),
                      RichText(
                        text: TextSpan(
                          text: 'Additives: ',
                           style: Theme.of(context).textTheme.displayLarge,
                           children: <TextSpan>[
                            TextSpan(text: '${tea.additives.join(', ')}', style: Theme.of(context).textTheme.bodyLarge)
                           ]
                      )),
                    ],
                  ),
                ),          
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
                      child: Text('See it in your catalog', style: Theme.of(context).textTheme.bodyLarge)
                      ),        
                    ],
                  )                        
                ]
              ),         
          ),       
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context)=> HomePage()),
                (route)=> false);
            },
             icon: Icon(Icons.home))
          ],
        )),
    );
  }
}