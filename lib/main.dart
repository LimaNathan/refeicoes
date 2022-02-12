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
  Settings settings = Settings();

  List<Meal> _avaibleMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
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

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vamos Cozinhar?',
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
        AppRoutes.home: (ctx) => TabsScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMealsScreen(_avaibleMeals),
        AppRoutes.mealDetail: (ctx) =>
            MealDetailScreen(onToggleFavorite: _toggleFavorite, isFavorite: _isFavorite,),
        AppRoutes.settings: (ctx) =>
            SettingsScreen(onSettingsChanged: _filterMeals, settings: settings),
      },
    );
  }
}
