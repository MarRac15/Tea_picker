import 'package:flutter/material.dart';
import 'package:tea_picker/providers/changeThemeNotifier.dart';
import 'package:tea_picker/style/theme.dart';
import 'package:tea_picker/views/creator_screens/additives_page.dart';
import 'package:tea_picker/views/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //name: 'teaPicker',
    options: FirebaseOptions(
    apiKey: 'key',
    appId: '1:1053100711838:android:cf646d6a84017d32c7408f',
    messagingSenderId: 'sendid',
    projectId: 'teapicker-6a476',
    storageBucket: 'hellothere.com',
  )
  );
  
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
