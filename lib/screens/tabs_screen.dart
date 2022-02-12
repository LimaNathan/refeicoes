import 'package:flutter/material.dart';
import 'package:refeicoes/components/main_drawer.dart';
import 'package:refeicoes/models/meal.dart';
import 'package:refeicoes/screens/categories_screen.dart';
import 'package:refeicoes/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  static List<Meal> _favoriteMeals = [];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _favoriteMeals = widget.favoriteMeals;
  }

  final List<Widget> _screens = [
    const CategoriesScreen(),
    FavoriteScreen(favoriteMeals: _favoriteMeals),
  ];
  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(_titles[_selectedScreenIndex])),
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          )
        ],
      ),
    );
  }
}
