// ignore_for_file: void_checks, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:refeicoes/components/main_drawer.dart';
import 'package:refeicoes/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;
  const SettingsScreen(
      {Key? key, required this.onSettingsChanged, required this.settings})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  _createSwitch(
    String label,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) =>
      SwitchListTile.adaptive(
        value: value,
        onChanged: (value) {
          onChanged(value);
          widget.onSettingsChanged(settings);
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
