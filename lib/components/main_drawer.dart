import 'package:flutter/material.dart';
import 'package:refeicoes/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.home),
            leading: const Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: const Text(
              'Refeições',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.settings),
            leading: const Icon(
              Icons.settings,
              size: 26,
            ),
            title: const Text(
              'Configurações',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
