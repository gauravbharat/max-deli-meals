import 'package:flutter/material.dart';

import 'package:deli/models/meal.dart';
import 'package:deli/widgets/meals_list.dart';

class FavouritesPage extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouritesPage(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favourites yet - start adding some!'),
      );
    }

    return MealsList(mealsList: favouriteMeals);
  }
}
