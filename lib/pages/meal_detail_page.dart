import 'package:deli/dummy_data.dart';
import 'package:deli/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/category-meal-detail';

  final Function isFavourite;
  final Function toggleFavouriteHandler;

  MealDetailPage(this.isFavourite, this.toggleFavouriteHandler);

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    final Meal selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavourite(selectedMeal.id)
              ? Icons.favorite
              : Icons.favorite_outline,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          toggleFavouriteHandler(selectedMeal.id);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildListContainer(
                ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 10.0,
                      ),
                      child: Text(
                        selectedMeal.ingredients[index],
                      ),
                    ),
                  ),
                ),
                context),
            buildSectionTitle(context, 'Steps'),
            buildListContainer(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
              context,
            ),
          ],
        ),
      ),
    );
  }

  Container buildListContainer(ListView child, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      height: 150,
      width: 300,
      child: child,
    );
  }

  Container buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
