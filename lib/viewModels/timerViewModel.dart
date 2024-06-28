import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

import 'package:tea_picker/models/timer.dart';

class TimerViewModel extends StateNotifier<TimerModel> {
  Timer? _timer;

  TimerViewModel() : super(TimerModel(secondsRemaining: 0, isRunning: false));

  void startTimer(int durationInSeconds) {
    _timer?.cancel();
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

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final timerProvider = StateNotifierProvider<TimerViewModel, TimerModel>((ref) {
  return TimerViewModel();
});
