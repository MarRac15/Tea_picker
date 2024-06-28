import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_picker/viewModels/timerViewModel.dart';
import 'package:tea_picker/views/catalog_page.dart';

class TimerPage extends ConsumerWidget {
  final int brewingTime; // Czas parzenia w minutach

  TimerPage({required this.brewingTime});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerProvider);
    final timerViewModel = ref.read(timerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tea Brewing Timer'),
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
              child: Text(
                'Time remaining: ${timerState.secondsRemaining == 0 ? 'Done! Bon apetit' : timerState.secondsRemaining.toString()} seconds',
                style: Theme.of(context).textTheme.displayLarge,
              ),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogPage()));
              },
              child: Text('Back to Catalog', style: Theme.of(context).textTheme.bodyLarge),
            ),
          ],
        ),
      ),
    );
  }
}
