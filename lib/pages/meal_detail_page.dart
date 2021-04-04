import 'package:deli/dummy_data.dart';
import 'package:deli/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/category-meal-detail';

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    final Meal meal =
        (DUMMY_MEALS.where((meal) => meal.id == mealId).toList()[0] as Meal);

    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      body: Container(),
    );
  }
}
