import 'package:flutter/material.dart';

import '../../Widget/widgets.dart';
import 'package:flutter/services.dart';

class ClientScreen extends StatefulWidget {
  final Widget initialContent;
  final String titulo;
  const ClientScreen(this.initialContent, this.titulo, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  late Widget _currentWidget;
  late String _currentTitulo;
  @override
  void initState() {
    super.initState();
    _currentWidget = widget.initialContent;
    _currentTitulo = widget.titulo; // Setea el contenido inicial
  }

  // ignore: non_constant_identifier_names

  void _updateContent(Widget newWidget, String titulo) {
    setState(() {
      _currentWidget = newWidget;
      _currentTitulo = titulo;
    });
  }

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
          title: Text(_currentTitulo),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: ClientDrawer(onSelect: (Widget widget, String titulo) {
          _updateContent(widget, titulo);
          Navigator.of(context)
              .pop(); // Cierra el Drawer después de seleccionar
        }),
        body: _currentWidget,
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
