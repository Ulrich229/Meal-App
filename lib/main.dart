import "package:flutter/material.dart";

import './screens/category_meal_scren.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override

  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold
            )
          )
          ),
        title: "Meal App",
        home : TabsScreen(),
        routes: {
          CategoryMeal().nameRoute: (ctx) => CategoryMeal(),
          FiltersScreen().routeName: (ctx) => FiltersScreen()

        },

      )
    );
  }
}