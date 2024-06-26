import 'package:flutter/material.dart';
import 'package:tea_picker/viewModels/teaViewModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_picker/views/creator_screens/taste_page.dart';

class TypePage extends ConsumerWidget {
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teaViewModel = ref.watch(teaProvider.notifier);
    return Scaffold(
    appBar: AppBar(
        title: Text('Choose your base', style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40,),

            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  Text('Black tea', style: Theme.of(context).textTheme.bodyLarge),
                ]
              ),
              onTap: (){
                teaViewModel.setType('black');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> TastePage()));
              },
              tileColor: Theme.of(context).colorScheme.secondary
            ),

            SizedBox(height: 20,),

            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Green tea', style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              onTap: (){
                teaViewModel.setType('green');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> TastePage()));
              },
              tileColor: Theme.of(context).colorScheme.secondary,
            ),

            SizedBox(height: 20,),

            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('White tea', style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              onTap: (){
                teaViewModel.setType('white');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> TastePage()));
              },
              tileColor: Theme.of(context).colorScheme.secondary,
            ),
          ]),

      )
    );
  }
}