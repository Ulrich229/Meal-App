import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
 final Function act;

 MainDrawer(this.act);

Widget buildListTile(String title, IconData icon, Function fh){
  return ListTile(
    leading: Icon(icon, size: 26,),
    title: Text(title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, fontFamily: 'RobotoCondensed'),),
    onTap: fh,
  );
}
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Drawer(
        child: Column(children: <Widget>[
          Container(
            child: Center(child: Text("Menu", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),),
            color: Colors.yellowAccent,
            height: 100,
            width: double.infinity,
          ),
          SizedBox(height: 30),
        buildListTile('Meals', Icons.restaurant, (){
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile("Filters", Icons.settings,  (){
          Navigator.of(context).pushReplacementNamed(FiltersScreen().routeName, arguments: act );
          })
        ],),
      ),
    );
  }
}