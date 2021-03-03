import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../models/meal.dart';
import '../models/cities_list.dart';

class DetailMeal extends StatelessWidget {
  final String mealId;

  DetailMeal({@required this.mealId});


Widget petitCarre(String a, List<String> b){
  return Column(
      children: [
         Container(
            color: Colors.teal,
                 child: Text("$a", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold, fontSize: 15,),
                  ),
                ),
          SingleChildScrollView(
                child: Container(
                  height: 132,
                  child: Card(
                    elevation: 10,
                    child: ListView.builder(itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                        radius: 12,
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: FittedBox(
                            child: Text('#${(index + 1)}'),),
                           ),
                        ),
                        title: Text('${b[index]}', textAlign: TextAlign.justify, style: TextStyle(fontSize: 10),),
                      );
                    }, itemCount: b.length,
            ),
                ),
          )
          )
      ]);
}

  @override
  Widget build(BuildContext context) {
    final Meal meal = DUMMY_MEALS.firstWhere((test) => test.id == mealId);
    return Column(
      children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blueGrey,
            ),
            child: Text('${meal.title}', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold, fontSize: 22,),)
          ),
          petitCarre("Ingredients", meal.ingredients),
          petitCarre("Steps", meal.steps),
         ]
         );
}
}