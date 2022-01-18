import 'package:flutter/material.dart';
import 'package:refeicoes/data/dummy_data.dart';
import 'package:refeicoes/models/meal.dart';
import 'package:refeicoes/screens/categories_meals_screen.dart';
import 'package:refeicoes/screens/meal_detail_screen.dart';
import 'package:refeicoes/screens/settings_screen.dart';
import 'package:refeicoes/screens/tabs_screen.dart';
import 'models/settings.dart';
import 'utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _avaibleMeals = dummyMeals;
  void _filterMeals(Settings settings) {
    setState(() {
      _avaibleMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && meal.isLactoseFree;
        final filterVegan = settings.isVegan && meal.isVegan;
        final filterVegetarian = settings.isVegetarian && meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegetarian &&
            !filterVegan;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
            .copyWith(secondary: Colors.amber),
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              caption:
                  const TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
            ),
      ),
      routes: {
        AppRoutes.home: (ctx) => const TabsScreen(),
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMealsScreen(_avaibleMeals),
        AppRoutes.mealDetail: (ctx) => const MealDetailScreen(),
        AppRoutes.settings: (ctx) =>
            SettingsScreen(onSettingsChanged: _filterMeals),
      },
    );
  }
}
