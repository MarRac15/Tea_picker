import 'package:flutter/material.dart';
import 'package:tea_picker/models/tea.dart';
import 'package:tea_picker/services/firebase_service.dart';
import 'package:tea_picker/viewModels/teaViewModel.dart';
import 'package:tea_picker/views/home_page.dart';
import 'package:tea_picker/views/tea_details_page.dart';

class CatalogPage extends StatelessWidget{
  final FirebaseService firebase = FirebaseService();

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
    appBar: AppBar(
        title: Text('Your saved teas: ', style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: EdgeInsets.all(8.0),
        child: FutureBuilder<List<Tea>>(
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
                  final teaId = snapshot.data![index].id;
                  return ListTile(
                    title: Text('Tea ${index+1} - ${tea.name}', style: Theme.of(context).textTheme.displayLarge),
                    
                    // subtitle: Text('Type: ${tea.type}, Mood: ${tea.mood}, Flavor: ${tea.taste}, Intensity: ${tea.intensity}', style: Theme.of(context).textTheme.bodyLarge),
                    tileColor: Theme.of(context).colorScheme.secondary,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> TeaDetailsPage(tea: tea)
                          )
                      );
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
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context)=> HomePage()),
                (route)=> false);
            },
             icon: Icon(Icons.home))
          ],
        )
        ),
    );
  }
}