import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

import 'package:tea_picker/models/timer.dart';

class TimerViewModel extends StateNotifier<TimerModel> {
  Timer? _timer;
  int initialSeconds = 0;

  TimerViewModel() : super(TimerModel(secondsRemaining: 0, isRunning: false));

  void startTimer(int durationInSeconds) {
    _timer?.cancel();
    initialSeconds = durationInSeconds;
    state = state.copyWith(secondsRemaining: durationInSeconds, isRunning: true);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (state.secondsRemaining > 0) {
        state = state.copyWith(secondsRemaining: state.secondsRemaining - 1);
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    state = state.copyWith(isRunning: false);
  }

  void resetTimer(){
    stopTimer();
    state = state.copyWith(secondsRemaining: initialSeconds);
  }


  // void resumeTimer(){
  //   if(state.secondsRemaining>0){
  //     _timer?.cancel();
  //     _timer = Timer.periodic(Duration(seconds: 1), (timer){
  //       if(state.secondsRemaining>0){
  //         state = state.copyWith(secondsRemaining: state.secondsRemaining - 1);
  //       }
  //       else{
  //     _timer?.cancel();
  //   }
  //     });

  //   }
    
  // }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final timerProvider = StateNotifierProvider<TimerViewModel, TimerModel>((ref) {
  return TimerViewModel();
});
