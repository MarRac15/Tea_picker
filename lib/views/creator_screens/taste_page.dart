import 'package:flutter/material.dart';
import 'package:tea_picker/viewModels/teaViewModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_picker/views/creator_screens/mood_page.dart';

class TastePage extends ConsumerWidget {
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teaViewModel = ref.watch(teaProvider.notifier);
    return Scaffold(
    appBar: AppBar(
        title: Text('What should it taste like?', style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Center(
        child: Column(
          children: [

            SizedBox(height: 40,),

            ListTile(
              title: Text('Sweet', style: Theme.of(context).textTheme.bodyLarge),
              onTap: (){
                teaViewModel.setTaste('sweet');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MoodPage()));
              },
              tileColor: Theme.of(context).colorScheme.secondary
            ),

            SizedBox(height: 40,),

            ListTile(
              title: Text('Bitter', style: Theme.of(context).textTheme.bodyLarge),
              onTap: (){
                teaViewModel.setTaste('bitter');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MoodPage()));
              },
              tileColor: Theme.of(context).colorScheme.secondary
            ),

            SizedBox(height: 40,),

            ListTile(
              title: Text('Balanced taste', style: Theme.of(context).textTheme.bodyLarge),
              onTap: (){
                teaViewModel.setTaste('balanced');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MoodPage()));
              },
              tileColor: Theme.of(context).colorScheme.secondary
            )
          ]),

      )
    );
  }
}