import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_picker/models/tea.dart';
import 'package:tea_picker/viewModels/teaViewModel.dart';
import 'package:tea_picker/views/timer_page.dart';

class Instruction1Page extends ConsumerWidget{
  final Tea tea;
  Instruction1Page({required this.tea});

@override
  Widget build(BuildContext context, WidgetRef ref) { 
    final teaViewModel = ref.watch(teaProvider.notifier);
    return Scaffold(
    appBar: AppBar(
        title: Text('Brewing Instructions', style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Center(
        child: Column(
          children: [

            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.looks_one),
                Text('Heat up the water to ${tea.brewingTemp} degrees (Celsius)'),
              ],
            ),

            SizedBox(height: 30,),

            Icon(
              Icons.local_drink_sharp,
              size: 100,
              color: Theme.of(context).primaryColor,
              ),

            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.looks_two),
                Text('Brewing time: ${tea.brewingTime} minutes'),
              ],
            ),

            SizedBox(height: 30,),

            Icon(
              Icons.timer,
              size: 100,
              color: Theme.of(context).primaryColor,
              ),

              SizedBox(height: 30,),


              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text('After that, click "Next" and the timer will kick off'),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TimerPage(brewingTime: tea.brewingTime)));
                }, 
                child: Text('Next', style: Theme.of(context).textTheme.bodyLarge))
          ]
          )
      )
    );     
  }
}
