import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../models/meal.dart';
import '../widgets/detail_meal.dart';


class MealItem extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability
  });

  @override
  _MealItemState createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
String get complexityText {
  switch (widget.complexity){
    case Complexity.Challenging:
      return 'Challenging';
      break;

    case Complexity.Hard:
      return 'Hard';
      break;

    case Complexity.Simple:
      return 'Simple';
      break;

    default:
      return 'Unknow';
      break;

  }
}

String get affordabilityText {
  switch (widget.affordability){
    case Affordability.Affordable:
      return 'Affordable';
      break;

    case Affordability.Luxurious:
      return 'Luxurious';
      break;

    case Affordability.Pricey:
      return 'Pricey';
      break;

    default:
      return 'Unknow';
      break;

  }
}

void selectMeal(BuildContext ctx, String id) {
  showModalBottomSheet(context: ctx, builder: (dctx) {
    return DetailMeal(mealId: id);
  }) ;
}

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () => selectMeal(context, widget.id),
        child:
          Column(
            children: <Widget>[
              Stack(children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                  ),
                  child: Image.network(widget.imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover,),
                ),
                Positioned(bottom: 20,
                right: 10,
                child: Container(color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 5, 
                horizontal: 20),
                  child: 
                Text(widget.title, style: TextStyle(fontSize: 26, color: Colors.white),
                 softWrap: true, overflow: TextOverflow.fade,)
                 ),
                ),
              ],
              ),
             Padding(padding: EdgeInsets.all(20),
             child:Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: <Widget>[ Row(
                children: <Widget>[
                  Icon(Icons.schedule),
                  Text('${widget.duration}')
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.work),
                  Text(complexityText)
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.attach_money),
                  Text(affordabilityText)
                ],
              )
              ]
             ) ,) 
            ],
          ),
      ),
    );
  }
}