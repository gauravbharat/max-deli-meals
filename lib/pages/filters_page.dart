import 'package:deli/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = "/filters";

  final Map<String, bool> filters;
  final Function saveFilters;

  FiltersPage(this.filters, this.saveFilters);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  Map<String, bool> _currentFilters;

  @override
  void initState() {
    super.initState();
    _currentFilters = {...widget.filters};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters'), actions: [
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () => widget.saveFilters(_currentFilters),
        ),
      ]),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Adjust your meal selection.',
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
                  value: _currentFilters['gluten'],
                  updateValueHandler: (_) {
                    setState(() {
                      _currentFilters['gluten'] = !_currentFilters['gluten'];
                    });
                  },
                ),
                buildSwitchListTile(
                  context: context,
                  titleText: 'Lactose-free',
                  descriptionText: 'Only include lactose-free meals.',
                  value: _currentFilters['lactose'],
                  updateValueHandler: (_) {
                    setState(() {
                      _currentFilters['lactose'] = !_currentFilters['lactose'];
                    });
                  },
                ),
                buildSwitchListTile(
                  context: context,
                  titleText: 'Vegetarian',
                  descriptionText: 'Only include vegetarian meals.',
                  value: _currentFilters['vegetarian'],
                  updateValueHandler: (_) {
                    setState(() {
                      _currentFilters['vegetarian'] =
                          !_currentFilters['vegetarian'];
                    });
                  },
                ),
                buildSwitchListTile(
                  context: context,
                  titleText: 'Vegan',
                  descriptionText: 'Only include vegan meals.',
                  value: _currentFilters['vegan'],
                  updateValueHandler: (_) {
                    setState(() {
                      _currentFilters['vegan'] = !_currentFilters['vegan'];
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
