import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:frontend/domain/domain.dart';
import 'package:frontend/utils/storage/storagex.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart'
    as places;
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';

class OrigenScreen extends StatefulWidget {
  const OrigenScreen({super.key});

  @override
  State<OrigenScreen> createState() => _OrigenScreenState();
}

class _OrigenScreenState extends State<OrigenScreen> {
  late maps.GoogleMapController mapController;
  String _mapStyle = '';
  late maps.LatLng _currentPosition = const maps.LatLng(37.7749, -122.4194);
  final TextEditingController _searchController = TextEditingController();
  late places.FlutterGooglePlacesSdk _places;
  Set<maps.Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _places = places.FlutterGooglePlacesSdk(dotenv.env['API_KEY_MAPS']!);
    _loadMapStyle();
    _getCurrentPosition();
  }

  Future<void> _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica si el servicio de ubicación está habilitado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Muestra un mensaje al usuario y termina
      print('Location services are disabled.');
      return;
    }

    // Verifica el permiso de ubicación
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // El usuario ha denegado el permiso
        print('Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // El usuario ha denegado el permiso de manera permanente
      print('Location permissions are permanently denied');
      return;
    }

    // Si se tienen los permisos, obtén la ubicación
    try {
      UbicacionOrigenStorage ubicacionOrigenStorage = UbicacionOrigenStorage();
      final ubicacion = await ubicacionOrigenStorage.get();
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        if (ubicacion != null) {
          _currentPosition = maps.LatLng(double.parse(ubicacion.latitud!),
              double.parse(ubicacion.longitud!));
        } else {
          _currentPosition = maps.LatLng(position.latitude, position.longitude);
        }
      });

      // Asegúrate de que mapController está inicializado antes de usarlo

      mapController.animateCamera(
        maps.CameraUpdate.newLatLng(_currentPosition),
      );
    } catch (e) {
      // Manejo de errores si no se puede obtener la ubicación
      print('Error getting location: $e');
    }
  }

  void _loadMapStyle() async {
    _mapStyle = await rootBundle.loadString('assets/map_style.json');
  }

  void _onMapCreated(maps.GoogleMapController controller) {
    mapController = controller;
    // ignore: deprecated_member_use
    mapController.setMapStyle(_mapStyle);

    // Ajusta la cámara al crear el mapa si ya tenemos la posición actual

    mapController.animateCamera(
      maps.CameraUpdate.newLatLng(_currentPosition),
    );
  }

  Future<void> _searchAddress() async {
    final predictions = await _places.findAutocompletePredictions(
      _searchController.text,
    );

    if (predictions.predictions.isNotEmpty) {
      final firstPrediction = predictions.predictions.first;
      final placeId = firstPrediction.placeId;

      final placeDetails = await _places.fetchPlace(
        placeId,
        fields: [places.PlaceField.Location],
      );

      final location = placeDetails.place?.latLng;
      if (location != null) {
        final maps.LatLng newPosition = maps.LatLng(
          location.lat,
          location.lng,
        );

        mapController.animateCamera(
          maps.CameraUpdate.newLatLng(newPosition),
        );

        setState(() {
          markers.clear();
          markers.add(
            maps.Marker(
              onTap: () {
                _onMapTapped(newPosition);
              },
              markerId: const maps.MarkerId('search_result'),
              position: newPosition,
              infoWindow: maps.InfoWindow(
                title: 'Dirección encontrada',
                snippet: firstPrediction.fullText,
              ),
            ),
          );
        });
      }
    }
  }

  Future<void> _onMapTapped(maps.LatLng latLng) async {
    final address = await _getAddressFromLatLng(latLng);

    // ignore: use_build_context_synchronously
    _showSaveDialog(latLng, address['ciudad']!, address['direccion']!);
  }

  Future<Map<String, String>> _getAddressFromLatLng(maps.LatLng latLng) async {
    final Dio dio = Dio(); // Inicializa Dio
    final apiKey = dotenv.env['API_KEY_MAPS'];
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

  void _showSaveDialog(maps.LatLng latLng, String ciudad, String direccion) {
    final nombreCiudadController = TextEditingController(text: ciudad);
    final direccionController = TextEditingController(text: direccion);
    final precisionController = TextEditingController();
    final fechaHoraController =
        TextEditingController(text: DateTime.now().toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Guardar ubicación'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nombreCiudadController,
                decoration: const InputDecoration(labelText: 'Ciudad'),
                enabled: false,
              ),
              TextField(
                controller: direccionController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Dirección'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Guarda los datos en la base de datos
                _saveData(
                    nombreCiudadController.text,
                    latLng.latitude.toString(),
                    latLng.longitude.toString(),
                    int.tryParse(precisionController.text),
                    DateTime.parse(fechaHoraController.text),
                    direccion,
                    context);
                Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _saveData(
      String nombreCiudad,
      String latitud,
      String longitud,
      int? precision,
      DateTime fechaHora,
      String direccion,
      BuildContext context) async {
    DispositivoStorage dispositivoStorage = DispositivoStorage();

    final dispositivo = await dispositivoStorage.get();

    final Ubicacion ubicacion = Ubicacion(
        nombreCiudad: nombreCiudad,
        direccion: direccion,
        latitud: latitud,
        longitud: longitud,
        dispositivoId: dispositivo!.id);

    UbicacionOrigenStorage ubicacionOrigenStorage = UbicacionOrigenStorage();

    await ubicacionOrigenStorage.save(ubicacion);
    // ignore: use_build_context_synchronously
    context.push('/ubicaciondestino');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Acción para el primer botón
                },
                child: Text('Botón 1'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Acción para el segundo botón
                },
                child: Text('Botón 2'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Acción para el tercer botón
                },
                child: Text('Botón 3'),
              ),
            ),
          ],
        ),
      ],
      appBar: AppBar(
        title: const Text('Dirección origen'),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          maps.GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: maps.CameraPosition(
              target: _currentPosition,
              zoom: 12.0,
            ),
            onTap: (maps.LatLng latLng) {
              _onMapTapped(latLng);
            },
            markers: markers,
            mapType: maps.MapType
                .normal, // Cambia a satélite si prefieres: MapType.satellite
            myLocationEnabled: true, // Muestra la ubicación actual
            zoomControlsEnabled: false, //
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Buscar dirección...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onSubmitted: (value) => _searchAddress(),
                ),
              ],
            ),
          ),
          Positioned(
            top: 80, // Ajusta este valor para la posición vertical
            right: 16, // Ajusta para la posición horizontal
            child: FloatingActionButton(
              onPressed: () async {
                await _getCurrentPosition();
              },
              backgroundColor: Colors.teal,
              child: const Icon(Icons.my_location, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
