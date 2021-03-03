import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final String routeName = '/FiltersScreen';
 // final Map <String, bool> filtered;
 
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
 
  Widget _buildSwitch(String title, String subtitle, bool varr, Function exc){
    return SwitchListTile(value: varr, onChanged: exc, title: Text(title, style: Theme.of(context).textTheme.title,), subtitle: Text(subtitle),);
  }


  @override
  Widget build(BuildContext context) {
    Function actualiser = ModalRoute.of(context).settings.arguments as Function;
    Map <String, bool> filtre = {'gluten': _glutenFree,
    'vegan': _vegan,
    'vegetarian': _vegetarian,
    'lactose': _lactoseFree};
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(icon: Icon(Icons.save), onPressed: null )
      ],title: Text("Filters", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
      drawer: MainDrawer(actualiser(filtre)
      ),
      body: Column(children: <Widget>[
        Container(child: Text("Choisissez vos préférences", style: Theme.of(context).textTheme.title,)
        ),
        _buildSwitch('Vegetarien',"Ne plus afficher les mets non végétariens", _vegetarian, (value){
          setState(() {
            _vegetarian = value;
          });
        }),
         _buildSwitch('Vegan',"N'afficher que les mets  non vegan", _vegan, (value){
          setState(() {
            _vegan = value;
          });
        }),
       _buildSwitch('Gluten',"N'afficher que les mets sans gluten", _glutenFree, (value){
          setState(() {
            _glutenFree = value;
          });
        }),
      _buildSwitch('Lactose',"N'afficher que les mets sans Lactose", _lactoseFree, (value){
          setState(() {
            _lactoseFree = value;
          });
        }),
      ],
      )
      );
}
}