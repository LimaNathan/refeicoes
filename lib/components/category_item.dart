// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:refeicoes/screens/categories_meals_screen.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.category);
  final Category category;

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return const CategoriesMealsScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.caption,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
