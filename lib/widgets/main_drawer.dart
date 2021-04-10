import 'package:deli/pages/categories_page.dart';
import 'package:deli/pages/filters_page.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120.0,
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          buildListTile(
              'Meals',
              Icons.restaurant,
              () => Navigator.of(context)
                  .pushReplacementNamed(CategoriesPage.routeName)),
          buildListTile(
              'Filters',
              Icons.settings,
              () => Navigator.of(context)
                  .pushReplacementNamed(FiltersPage.routeName)),
        ],
      ),
    );
  }

  ListTile buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }
}
