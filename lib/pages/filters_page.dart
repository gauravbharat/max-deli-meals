import 'package:deli/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = "/filters";

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Adujust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          // Don't use ListView directly in a Column to avoid UI out-of-display area
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  context: context,
                  titleText: 'Gluten-free',
                  descriptionText: 'Only include gluten-free meals.',
                  value: _glutenFree,
                  updateValueHandler: (_) {
                    setState(() {
                      _glutenFree = !_glutenFree;
                    });
                  },
                ),
                buildSwitchListTile(
                  context: context,
                  titleText: 'Lactose-free',
                  descriptionText: 'Only include lactose-free meals.',
                  value: _lactoseFree,
                  updateValueHandler: (_) {
                    setState(() {
                      _lactoseFree = !_lactoseFree;
                    });
                  },
                ),
                buildSwitchListTile(
                  context: context,
                  titleText: 'Vegetarian',
                  descriptionText: 'Only include vegetarian meals.',
                  value: _vegetarian,
                  updateValueHandler: (_) {
                    setState(() {
                      _vegetarian = !_vegetarian;
                    });
                  },
                ),
                buildSwitchListTile(
                  context: context,
                  titleText: 'Vegan',
                  descriptionText: 'Only include vegan meals.',
                  value: _vegan,
                  updateValueHandler: (_) {
                    setState(() {
                      _vegan = !_vegan;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile({
    BuildContext context,
    String titleText,
    String descriptionText,
    bool value,
    Function updateValueHandler,
  }) {
    return SwitchListTile.adaptive(
      title: Text(titleText),
      subtitle: Text(descriptionText),
      activeColor: Theme.of(context).accentColor,
      value: value,
      onChanged: updateValueHandler,
    );
  }
}
