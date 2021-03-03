import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './cityChoise.dart';
import '../widgets/main_drawer.dart';


class TabsScreen extends StatefulWidget {
  TabsScreen({Key key}) : super(key: key);

  @override
  
  _TabsScreenState createState() => _TabsScreenState();
}


class _TabsScreenState extends State<TabsScreen> {
 int _selectedindex =0 ;
   void initState() { 
    _filtre = {'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false};
    super.initState();
    
  }
Map <String, bool> _filtre;

 void _actualiser(Map <String, bool> cx){
   
    setState(() {
      _filtre = {'gluten': cx['gluten'],
    'vegan': cx['vegan'],
    'vegetarian': cx['vegetarian'],
    'lactose': cx['lactose']};
    });
  }

 List<Object> _screens = [Citychoise(), FavoriteScreen()];

void _selectedPage(int index){
 setState(() {
    _selectedindex = index;
 });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _selectedindex == 0? Text("Meals App"): Text("Favorites")),
      drawer: MainDrawer(_actualiser),
      body:_screens[_selectedindex] ,
      bottomNavigationBar: BottomNavigationBar(
         currentIndex: _selectedindex,
         selectedItemColor: Colors.yellowAccent,
         unselectedItemColor: Colors.black38,
         selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
         showSelectedLabels: true,
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [BottomNavigationBarItem(icon: Icon(Icons.category), title: Text("Categories")),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text("Favorits"))]
    )
    );
  }
}