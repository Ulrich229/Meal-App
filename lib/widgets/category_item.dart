import 'package:flutter/material.dart';


class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.title, this.color, this.id);

  void changeScreen(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      '/category_meal_screen', 
      arguments: {
        "id": id,
        "title": title,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap:() => changeScreen(context),
        borderRadius: BorderRadius.circular(15),
        splashColor: Colors.lightGreenAccent,
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Text(title, style: Theme.of(context).textTheme.title, softWrap: true, overflow: TextOverflow.fade,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}