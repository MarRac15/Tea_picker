import 'package:flutter/material.dart';
import 'package:tea_picker/providers/changeThemeNotifier.dart';
import 'package:tea_picker/style/theme.dart';
import 'package:tea_picker/views/catalog_page.dart';
import 'package:tea_picker/views/creator_screens/type._page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(changeThemeNotifierProvider);
    const String teaIconPath = 'assets/tea-svgrepo-com.svg';

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Tea Creator', style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TypePage()));
              },
               child: Text('Create your tea', style: Theme.of(context).textTheme.bodyLarge)),

               ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogPage()));
              },
               child: Text('Visit your catalog', style: Theme.of(context).textTheme.bodyLarge)
               ),

               Text('change theme: ', style: Theme.of(context).textTheme.bodyLarge),
               Switch(
                value: themeMode == AppThemeMode.Dark, 
                onChanged: (value){
                  final notifier = ref.read(changeThemeNotifierProvider.notifier);
                  notifier.switchTheme();
                },
                activeColor: AppTheme.primaryColor,
                inactiveTrackColor: AppTheme.accentColor,
                )
          ],
        ),
      )
    );
  }
}