import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;

import '../../widget/widgets.dart';

class OtroWidget extends StatefulWidget {
  const OtroWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OtroWidgetState createState() => _OtroWidgetState();
}

class _OtroWidgetState extends State<OtroWidget> {
  final maps.LatLng _currentPosition =
      const maps.LatLng(37.7749, -122.4194); // Posición actual
  final Set<maps.Marker> _markers = {};

  // Creamos un GlobalKey para acceder al estado de MapaWidget
  final GlobalKey<MapaWidgetState> _mapaKey = GlobalKey<MapaWidgetState>();

  void _onMapTapped(maps.LatLng latLng) async {
    // Llama a la función getAddressFromLatLng desde MapaWidget
    final address =
        await _mapaKey.currentState?.widget.getAddressFromLatLng(latLng);

    if (address != null) {
      _showSaveDialog(latLng, address['ciudad']!, address['direccion']!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Otro Widget con Mapa'),
      ),
      body: MapaWidget(
        key: _mapaKey,
        currentPosition: _currentPosition,
        markers: _markers,
        onTap: _onMapTapped,
      ),
    );
  }

  void _showSaveDialog(maps.LatLng latLng, String ciudad, String direccion) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Guardar Ubicación'),
          content: Text('Ciudad: $ciudad\nDirección: $direccion'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Lógica para guardar la ubicación
                Navigator.of(context).pop();
              },
              child: Text('Guardar'),
            ),
          ],
        );
      },
    );
  }
}
