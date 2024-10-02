import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart' show rootBundle;

class MapaWidget extends StatefulWidget {
  final maps.LatLng currentPosition;
  final Set<maps.Marker> markers;
  final Function(maps.LatLng) onTap;

  const MapaWidget({
    super.key,
    required this.currentPosition,
    required this.markers,
    required this.onTap,
  });

  @override
  // ignore: library_private_types_in_public_api
  MapaWidgetState createState() => MapaWidgetState();

  // Exponemos la función como un método público
  Future<Map<String, String>> getAddressFromLatLng(maps.LatLng latLng) async {
    final Dio dio = Dio(); // Inicializa Dio
    final apiKey =
        dotenv.env['API_KEY_MAPS']; // Asegúrate de cargar dotenv antes
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latLng.latitude},${latLng.longitude}&key=$apiKey';

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;

        // Extraer los address_components
        final addressComponents = data['results'][0]['address_components'];

        String direccion = '';
        String ciudad = '';

        // Recorrer los componentes de la dirección
        for (var component in addressComponents) {
          final types = component['types'];

          // Verificar si el componente es la calle o la ruta
          if (types.contains('street_address') || types.contains('route')) {
            direccion = component['long_name'];
          }

          // Verificar si el componente es la ciudad
          if (types.contains('locality')) {
            ciudad = component['long_name'];
          }
        }

        // Si no encuentra la dirección o ciudad, usar valores predeterminados
        if (direccion.isEmpty) direccion = 'Dirección no disponible';
        if (ciudad.isEmpty) ciudad = 'Ciudad no disponible';

        // Devolver como un mapa con la dirección y la ciudad
        return {
          'direccion': direccion,
          'ciudad': ciudad,
        };
      } else {
        throw Exception('Failed to load address');
      }
    } catch (e) {
      print('Error: $e');
      return {
        'direccion': 'Dirección desconocida',
        'ciudad': 'Ciudad desconocida',
      };
    }
  }
}

class MapaWidgetState extends State<MapaWidget> {
  late maps.GoogleMapController mapController;
  String _mapStyle = '';

  @override
  void initState() {
    super.initState();
    // _places = places.FlutterGooglePlacesSdk(dotenv.env['API_KEY_MAPS']!);
    _loadMapStyle();
    getPermission();
  }

  Future<void> getPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica si el servicio de ubicación está habilitado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Muestra un SnackBar si el servicio de ubicación está deshabilitado
      _showSnackBar('Los servicios de ubicación están deshabilitados.');
      return;
    }

    // Verifica el permiso de ubicación
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Muestra un SnackBar si el permiso fue denegado
        _showSnackBar('Permisos de ubicación denegados.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Muestra un SnackBar si los permisos fueron denegados permanentemente
      _showSnackBar(
          'Los permisos de ubicación están permanentemente denegados.');
      return;
    }

    // Si llega hasta aquí, significa que los permisos fueron concedidos
    _showSnackBar('Permisos de ubicación concedidos.');
  }

  // Función para mostrar un SnackBar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _loadMapStyle() async {
    _mapStyle = await rootBundle.loadString('assets/map_style.json');
  }

  void _onMapCreated(maps.GoogleMapController controller) {
    mapController = controller;

    // ignore: deprecated_member_use
    mapController.setMapStyle(_mapStyle);

    // Ajusta la cámara si ya tenemos la posición actual
    mapController.animateCamera(
      maps.CameraUpdate.newLatLng(widget.currentPosition),
    );
  }

  @override
  Widget build(BuildContext context) {
    return maps.GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: maps.CameraPosition(
        target: widget.currentPosition,
        zoom: 12.0,
      ),
      onTap: widget.onTap,
      markers: widget.markers,
      mapType: maps.MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
    );
  }
}
