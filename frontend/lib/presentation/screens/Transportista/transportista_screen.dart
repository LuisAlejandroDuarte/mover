import 'package:flutter/material.dart';
import '../../Widget/widgets.dart';
import 'package:flutter/services.dart';

class TransportistaScreen extends StatelessWidget {
  const TransportistaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        bool salir = await mostrarDialogoSalir(context);
        return salir;
      },
      child: Scaffold(
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
      ),
    );
  }

  Future<bool> mostrarDialogoSalir(BuildContext context) async {
    return await showDialog(
          context: context,
          barrierDismissible: false, // Evita cerrar tocando fuera del diálogo
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Salir de la aplicación"),
              content: const Text("¿Estás seguro de que deseas salir?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop(); // Cierra la aplicación
                  },
                  child: const Text("Sí"),
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
