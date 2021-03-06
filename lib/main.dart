import 'package:flutter/material.dart';

import 'package:deli/dummy_data.dart';
import 'package:deli/models/meal.dart';
import 'package:deli/pages/categories_page.dart';
import 'package:deli/pages/category_meals_page.dart';
import 'package:deli/pages/filters_page.dart';
import 'package:deli/pages/meal_detail_page.dart';
import 'package:deli/pages/tabs_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }

        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }

        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }

        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavourite(String mealId) {
    return _favouriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: MaterialColor(
            0xFF004643,
            <int, Color>{
              50: Color.fromRGBO(0, 70, 67, .1),
              100: Color.fromRGBO(0, 70, 67, .2),
              200: Color.fromRGBO(0, 70, 67, .3),
              300: Color.fromRGBO(0, 70, 67, .4),
              400: Color.fromRGBO(0, 70, 67, .5),
              500: Color.fromRGBO(0, 70, 67, .6),
              600: Color.fromRGBO(0, 70, 67, .7),
              700: Color.fromRGBO(0, 70, 67, .8),
              800: Color.fromRGBO(0, 70, 67, .9),
              900: Color.fromRGBO(0, 70, 67, 1),
            },
          ),
          accentColor: Color(0xFFf9bc60),
          // cardColor: Color(0xFFabd1c6),
          highlightColor: Color(0xFFf9bc60),
          canvasColor: Color(0xffddefe6),
          scaffoldBackgroundColor: Color(0xffddefe6),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(color: Color(0xFF001e1d)),
              headline6: TextStyle(
                fontSize: 20.0,
                fontFamily: 'RobotoCondensed',
                // fontWeight: FontWeight.bold,
              )),
          buttonTheme: ButtonThemeData()
          // primarySwatch: Colors.green,
          ),
      routes: {
        CategoriesPage.routeName: (_) => TabPage(_favouriteMeals),
        CategoryMealsPage.routeName: (_) => CategoryMealsPage(_availableMeals),
        MealDetailPage.routeName: (_) =>
            MealDetailPage(_isMealFavourite, _toggleFavourite),
        FiltersPage.routeName: (_) => FiltersPage({..._filters}, _setFilters),
      },
      // Use onGenerateRoute for dynamic routes or conditional display of routes on settings.name
      // It takes a funciton which executes for any named navigation action (= pushNamed()) for which
      // no registered route was found in the routes table. You should return a navigation action i.e. the
      // MaterialPageRoute in onGenerateRoute
      // onGenerateRoute is your fallback/ option to have more control about the creation + configuration of
      // routing actions (= MaterialPageRoute that then loads a specific screen widget).
      // onGenerateRoute: (settings) {},

      //  Use onUnknownRoute for undefined routes, fallback to 404 or home page to avoid crash
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => CategoriesPage());
      },

      //  onGenerateRoute executes for any unregistered named route,
      //  onUnknownRoute executes if onGenerateRoute isn't defined or doesn't return a valid navigation action
    );
  }
}
