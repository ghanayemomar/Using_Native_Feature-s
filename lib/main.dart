import 'package:flutter/material.dart';
import 'package:project/screens/add_place_screen.dart';
import 'package:project/screens/places_list.dart';
import 'package:provider/provider.dart';
import './providers/great_places.dart';
import './screens/add_place_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Great Places',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.amber,
          ),
          home: PlacesListScreen(),
          routes: {
            AddPlaceScreen.RouteName: (ctx) => AddPlaceScreen(),
          }),
    );
  }
}
