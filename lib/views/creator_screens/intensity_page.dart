import 'package:flutter/material.dart';
import 'package:tea_picker/providers/additivesNotifier.dart';
import 'package:tea_picker/viewModels/teaViewModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_picker/views/creator_screens/additives_page.dart';

class IntensityPage extends ConsumerWidget {
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teaViewModel = ref.watch(teaProvider.notifier);
    return Scaffold(
    appBar: AppBar(
        title: Text('Choose intensity', style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: Text('Strong', style: Theme.of(context).textTheme.bodyLarge),
              onTap: (){
                teaViewModel.setIntensity('strong');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AdditivesPage()));
              },
              tileColor: Theme.of(context).colorScheme.secondary
            ),

            SizedBox(height: 40,),

            ListTile(
              title: Text('Medium', style: Theme.of(context).textTheme.bodyLarge),
              onTap: (){
                teaViewModel.setIntensity('medium');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AdditivesPage()));
              },
              tileColor: Theme.of(context).colorScheme.secondary
            ),

            SizedBox(height: 40,),

            ListTile(
              title: Text('Mild', style: Theme.of(context).textTheme.bodyLarge),
              onTap: (){
                teaViewModel.setIntensity('mild');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AdditivesPage()));
              },
              tileColor: Theme.of(context).colorScheme.secondary
            ),
          ]),

      )
    );
  }

}
