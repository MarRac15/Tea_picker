import 'package:tea_picker/style/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final changeThemeNotifierProvider = StateNotifierProvider<ChangeThemeNotifier, AppThemeMode>((ref) {
  return ChangeThemeNotifier();
});

class ChangeThemeNotifier extends StateNotifier<AppThemeMode>{
  ChangeThemeNotifier(): super(AppThemeMode.Light);

  void switchTheme(){
    state = state == AppThemeMode.Light ? AppThemeMode.Dark : AppThemeMode.Light;

  }
}