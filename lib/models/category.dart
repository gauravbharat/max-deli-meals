import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
  });

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        color = json['color'];

  Map<String, dynamic> toJson() {
    return {'id': this.id, 'title': this.title, 'color': this.color};
  }
}
