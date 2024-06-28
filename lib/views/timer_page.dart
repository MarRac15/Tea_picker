import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_picker/viewModels/timerViewModel.dart';
import 'package:tea_picker/views/catalog_page.dart';
import 'package:tea_picker/views/home_page.dart';

class TimerPage extends ConsumerWidget {
  final int brewingTime; // Czas parzenia w minutach

  TimerPage({required this.brewingTime});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerProvider);
    final timerViewModel = ref.read(timerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tea Brewing Timer', style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(5.0)
              ),
              child: 
              RichText(
                        text: TextSpan(
                          text: 'Time remaining: ',
                           style: Theme.of(context).textTheme.displayLarge,
                           children: <TextSpan>[
                            TextSpan(text: '${timerState.secondsRemaining== 0 ? 'Done!' : timerState.secondsRemaining.toString()} s', style: Theme.of(context).textTheme.bodyLarge)
                           ]
                      )),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
              onPressed: timerState.isRunning
                  ? timerViewModel.stopTimer
                  : () {
                      // Przeliczanie minut na sekundy
                      int brewingTimeInSeconds = brewingTime*60;
                      timerViewModel.startTimer(brewingTimeInSeconds);
                    },
              child: Text(timerState.isRunning ? 'Stop Timer' : 'Start Timer', style: Theme.of(context).textTheme.bodyLarge),
            ),
            SizedBox(height: 50),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
              onPressed: (){
                timerViewModel.stopTimer();
                Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogPage()));
              },
              child: Text('Back to Catalog', style: Theme.of(context).textTheme.bodyLarge),
            ),
            // SizedBox(width: 10),
            //     ElevatedButton(
            //       onPressed: () {
            //         timerViewModel.resumeTimer();
            //       },
            //       child: Text('Resume'),
            //     ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){
              timerViewModel.stopTimer();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context)=> HomePage()),
                (route)=> false);
            },
             icon: Icon(Icons.home))
          ],
        )
        ),
    );
  }
}
