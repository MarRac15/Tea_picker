import 'package:flutter/material.dart';
import 'package:tea_picker/models/tea.dart';
import 'package:tea_picker/services/firebase_service.dart';
import 'package:tea_picker/views/catalog_page.dart';
import 'package:tea_picker/views/instruction1_page.dart';

class TeaDetailsPage extends StatelessWidget{
  final Tea tea;

  TeaDetailsPage({required this.tea});

  final FirebaseService firebase = FirebaseService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: Text('${tea.name} - details:', style: Theme.of(context).textTheme.displayLarge),
      ),

      resizeToAvoidBottomInset: true,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
        
              RichText(
                        text: TextSpan(
                          text: 'Type: ',
                           style: Theme.of(context).textTheme.displayLarge,
                           children: <TextSpan>[
                            TextSpan(text: '${tea.type}', style: Theme.of(context).textTheme.bodyLarge)
                           ]
                      )),
              RichText(
                        text: TextSpan(
                          text: 'Taste: ',
                           style: Theme.of(context).textTheme.displayLarge,
                           children: <TextSpan>[
                            TextSpan(text: '${tea.taste}', style: Theme.of(context).textTheme.bodyLarge)
                           ]
                      )),
              RichText(
                        text: TextSpan(
                          text: 'Mood: ',
                           style: Theme.of(context).textTheme.displayLarge,
                           children: <TextSpan>[
                            TextSpan(text: '${tea.mood}', style: Theme.of(context).textTheme.bodyLarge)
                           ]
                      )),
              RichText(
                        text: TextSpan(
                          text: 'Intensity: ',
                           style: Theme.of(context).textTheme.displayLarge,
                           children: <TextSpan>[
                            TextSpan(text: '${tea.intensity}', style: Theme.of(context).textTheme.bodyLarge)
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
        
              SizedBox(height: 40,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   ElevatedButton(
                     style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      ),
                      onPressed: () async{
              
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Instruction1Page(tea: tea,)));
                      }, 
                      child: Text('Start brewing!', style: Theme.of(context).textTheme.bodyLarge)
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
              ),
              ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error
                    ),
                    onPressed: () async{
                      await firebase.deleteTea(tea.id);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Tea deleted succesfully!'),
                          )
                        );
                    }, 
                    child: Text('Delete this tea', style: Theme.of(context).textTheme.bodyLarge)
                    ),
        
             
            ]
            ),
        
        ),
      )
    );
  }
}


