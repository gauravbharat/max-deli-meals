import 'package:flutter/material.dart';
import 'package:deli/models/meal.dart';
import 'package:deli/widgets/meal_item.dart';

class MealsList extends StatelessWidget {
  const MealsList({
    Key key,
    @required this.mealsList,
  }) : super(key: key);

  final List<Meal> mealsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mealsList.length,
      itemBuilder: (ctx, index) {
        return MealItem(
          id: mealsList[index].id,
          title: mealsList[index].title,
          imageUrl: mealsList[index].imageUrl,
          duration: mealsList[index].duration,
          complexity: mealsList[index].complexity,
          affordability: mealsList[index].affordability,
        );
      },
    );
  }
}
