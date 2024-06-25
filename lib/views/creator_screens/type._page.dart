import 'package:flutter/material.dart';

class TypePage extends StatelessWidget {
  const TypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: Text('Choose your base', style: Theme.of(context).textTheme.displayLarge),
      ),
    );
  }
}