import 'package:flutter/material.dart';

import '../models/cities_list.dart';
import '../widgets/category_item.dart';

class Citychoise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /* Container(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(109, 155, 205, 1),
        appBar: AppBar(
          title: Text("Eat Fast")
        ),
        body: */ GridView(
          padding: EdgeInsets.all(25),
          children: my_cities.map((a){
            return CategoryItem(a.name, a.color, a.id);
          }).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          ),
    );
  }
}