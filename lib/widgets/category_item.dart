import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color colour;

  const CategoryItem({@required this.title, @required this.colour});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [colour.withOpacity(0.3), colour],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
