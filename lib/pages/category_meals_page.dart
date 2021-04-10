import 'package:flutter/material.dart';

import 'package:deli/models/meal.dart';
import 'package:deli/widgets/meals_list.dart';

class CategoryMealsPage extends StatelessWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  CategoryMealsPage(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        (ModalRoute.of(context).settings.arguments as Map<String, dynamic>);
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final List<Meal> categoryMeals = availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: MealsList(mealsList: categoryMeals),
      ),
    );
  }
}
