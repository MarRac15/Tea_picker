import 'package:flutter/material.dart';
import 'package:tea_picker/viewModels/teaViewModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_picker/views/creator_screens/intensity_page.dart';

class MoodPage extends ConsumerWidget {
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teaViewModel = ref.watch(teaProvider.notifier);
    return Scaffold(
    appBar: AppBar(
        title: Text('How are you feeling?', style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40,),
            
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sleepy', style: Theme.of(context).textTheme.bodyLarge)
                  ]
                  ),
              onTap: (){
                teaViewModel.setMood('sleepy');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> IntensityPage()));
              },
              tileColor: Theme.of(context).colorScheme.secondary
            ),

            SizedBox(height: 40,),

            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Joyful', style: Theme.of(context).textTheme.bodyLarge)
                  ]
                  ),
              onTap: (){
                teaViewModel.setMood('joyful');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> IntensityPage()));
              },
              tileColor: Theme.of(context).colorScheme.secondary
            ),

            SizedBox(height: 40,),

            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Stressed', style: Theme.of(context).textTheme.bodyLarge)
                  ]
                  ),
              onTap: (){
                teaViewModel.setMood('stressed');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> IntensityPage()));
              },
              tileColor: Theme.of(context).colorScheme.secondary
            ),

            SizedBox(height: 40,),

            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('I do not know', style: Theme.of(context).textTheme.bodyLarge)
                  ]
                  ),
              onTap: (){
                teaViewModel.setMood('nothing');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> IntensityPage()));
              },
              tileColor: Theme.of(context).colorScheme.secondary
            ),
          ]),

      )
    );
  }
}