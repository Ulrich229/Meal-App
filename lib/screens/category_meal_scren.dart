import 'package:flutter/material.dart';


import '../models/cities_list.dart';
import '../widgets/meals_item.dart';


class CategoryMeal extends StatelessWidget {

  final String nameRoute= '/category_meal_screen';


 @override

  Widget build(BuildContext context) {
    final tags = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final pageTitle = tags["title"];
    final pageId = tags["id"];
    final filtered = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(pageId);
    }).toList();
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text(pageTitle)),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
          return MealItem(id: filtered[index].id,
            title: filtered[index].title,
           imageUrl: filtered[index].imageUrl,
            complexity: filtered[index].complexity,
            affordability: filtered[index].affordability,
            duration: filtered[index].duration,);
         },itemCount: filtered.length,
        ),
    )
    );
  }
}