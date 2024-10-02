// transportista_screen.dart
import 'package:flutter/material.dart';

import '../../Widget/widgets.dart';

class TransportistaScreen extends StatelessWidget {
  const TransportistaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transportista'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: const TransportistaDrawer(),
      body: const Center(
        child: Text('Contenido Principal de Transportista'),
      ),
    );
  }
}
