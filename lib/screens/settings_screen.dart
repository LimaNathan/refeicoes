// ignore_for_file: void_checks

import 'package:flutter/material.dart';
import 'package:refeicoes/components/main_drawer.dart';
import 'package:refeicoes/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  _createSwitch(
          String label, String subtitle, bool value, Function onChanged) =>
      SwitchListTile(
        value: value,
        onChanged: (value) {
          return onChanged(value);
        },
        title: Text(label),
        subtitle: Text(subtitle),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                    'Sem Gluten',
                    'Só exibe refeições sem gluten',
                    settings.isGlutenFree,
                    (value) => setState(() {
                          settings.isGlutenFree = value;
                        })),
                _createSwitch(
                    'Sem Lactose',
                    'Só exibe refeições sem lactose',
                    settings.isLactoseFree,
                    (value) => setState(() {
                          settings.isLactoseFree = value;
                        })),
                _createSwitch(
                    'Vegana',
                    'Só exibe refeições veganas',
                    settings.isVegan,
                    (value) => setState(() {
                          settings.isVegan = value;
                        })),
                _createSwitch(
                    'Vegetariana',
                    'Só exibe refeições vegetarianas',
                    settings.isVegetarian,
                    (value) => setState(() {
                          settings.isVegetarian = value;
                        }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
