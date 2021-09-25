import 'package:app_22_recipe_app/widgets/filters.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _getDrawerTab(
      BuildContext context, IconData icon, String title, Function tapHandler) {
    return ListTile(
        leading: Icon(
          icon,
          size: 26,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        onTap: () => tapHandler());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(25),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cook Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                  fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _getDrawerTab(context, Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(),
          _getDrawerTab(context, Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(Filters.routeName);
          }),
          Divider(),
        ],
      ),
    );
  }
}
