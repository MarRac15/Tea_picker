import 'package:flutter/material.dart';
import 'package:tea_picker/models/additive.dart';
import 'package:tea_picker/providers/additivesNotifier.dart';
import 'package:tea_picker/viewModels/teaViewModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_picker/views/creator_screens/results_page.dart';

class AdditivesPage extends ConsumerWidget {
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additives = Additive.getAdditives();
    final teaViewModel = ref.watch(teaProvider.notifier);
  

    return Scaffold(
    appBar: AppBar(
        title: Text('Select your additives:', style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Column(
        children: [

          SizedBox(
            height: 300,
            child: 
            ListView.builder(
              itemCount: additives.length,
              itemBuilder: ((context, index){

                final additive = additives[index];
                final isSelected = additive.isSelected;

                return CheckboxListTile(
                  title: Text(additive.name, style: Theme.of(context).textTheme.bodyLarge),
                  activeColor: Theme.of(context).colorScheme.secondary,
                  checkColor: Color.fromARGB(250, 250, 250, 250),
                  value: isSelected,
                  onChanged: (bool? value){
                    if (value != null){

                      ref.read(teaProvider.notifier).toggleAdditive(additive.name);
                      value = isSelected;
                    }
                      
                   }
                   );
              })
              ),
          ),
      
            ElevatedButton(
               style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage()));
              },
              child: Text('Next', style: Theme.of(context).textTheme.bodyLarge) 
              )
        ],
      )
    );
  }
}