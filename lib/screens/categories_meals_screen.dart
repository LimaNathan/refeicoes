// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:refeicoes/data/dummy_data.dart';
import 'package:refeicoes/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
      ),
    );
  }
}
