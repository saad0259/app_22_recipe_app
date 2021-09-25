import 'package:app_22_recipe_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  Filters(this.saveFilters, this.currentFilters);

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  static const routeName = '/filters';

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFree = false,
      _vegetarian = false,
      _vegan = false,
      _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters['gluten-free']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose-free']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten-free': _glutenFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                  'lactose-free': _lactoseFree,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your Meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                  title: Text('Gluten-Free'),
                  subtitle: Text('Only include Gluten-Free Meals'),
                  value: _glutenFree,
                  onChanged: (newVal) {
                    setState(() {
                      _glutenFree = newVal;
                    });
                  }),
              SwitchListTile(
                  title: Text('Vegetarian'),
                  subtitle: Text('Only include Vegetarian Meals'),
                  value: _vegetarian,
                  onChanged: (newVal) {
                    setState(() {
                      _vegetarian = newVal;
                    });
                  }),
              SwitchListTile(
                  title: Text('Vegan'),
                  subtitle: Text('Only include Vegan Meals'),
                  value: _vegan,
                  onChanged: (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  }),
              SwitchListTile(
                  title: Text('Lactose-Free'),
                  subtitle: Text('Only include Lactose-Free Meals'),
                  value: _lactoseFree,
                  onChanged: (newVal) {
                    setState(() {
                      _lactoseFree = newVal;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
