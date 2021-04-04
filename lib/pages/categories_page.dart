import 'package:deli/dummy_data.dart';
import 'package:deli/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deli Meals'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:
              200, // Max items in a row, each with a width of 200px
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                id: catData.id,
                title: catData.title,
                colour: catData.color,
              ),
            )
            .toList(),
      ),
    );
  }
}
