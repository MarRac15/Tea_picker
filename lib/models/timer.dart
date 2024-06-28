class TimerModel {
  final int secondsRemaining;
  final bool isRunning;

  TimerModel({required this.secondsRemaining, required this.isRunning});

  TimerModel copyWith({int? secondsRemaining, bool? isRunning}) {
    return TimerModel(
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}
