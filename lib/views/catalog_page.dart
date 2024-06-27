import 'package:flutter/material.dart';
import 'package:tea_picker/models/tea.dart';
import 'package:tea_picker/services/firebase_service.dart';

class CatalogPage extends StatelessWidget{
  final FirebaseService firebase = FirebaseService();

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
    appBar: AppBar(
        title: Text('Your saved teas: ', style: Theme.of(context).textTheme.displayLarge),
      ),
      body: FutureBuilder<List<Tea>>(
        future: firebase.fetchTeas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading teas'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No teas found'));
          } else {
            final teas = snapshot.data!;
            return ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: teas.length,
              itemBuilder: (context, index) {
                final tea = teas[index];
                return ListTile(
                  title: Text('Tea ${index+1} - ${tea.name}', style: Theme.of(context).textTheme.displayLarge),
                  subtitle: Text('Type: ${tea.type}, Mood: ${tea.mood}, Flavor: ${tea.taste}, Intensity: ${tea.intensity}', style: Theme.of(context).textTheme.bodyLarge),
                  tileColor: Theme.of(context).colorScheme.secondary,
                  onTap: () {
                    
                  },
                );
              },
              separatorBuilder: (context, index){
                return SizedBox(height: 20,);
              },
            );
          }
        },
      ),
    );
  }
}