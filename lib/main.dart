import 'package:flutter/material.dart';
import 'package:tea_picker/providers/changeThemeNotifier.dart';
import 'package:tea_picker/style/theme.dart';
import 'package:tea_picker/views/creator_screens/additives_page.dart';
import 'package:tea_picker/views/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(changeThemeNotifierProvider);
    return MaterialApp(
      title: 'Tea Picker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getThemeData(themeMode),
      home: HomePage(),
      routes: {
        '/additives': (_) => AdditivesPage(),
      }
    );
  }
}
