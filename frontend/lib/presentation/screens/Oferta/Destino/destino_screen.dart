import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:frontend/domain/domain.dart';
import 'package:frontend/utils/storage/georeferencia/departamento_storage.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart'
    as places;
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_settings/app_settings.dart';

import '../../../../utils/storage/storagex.dart';
import '../../../providers/georeferencia/ciudad/ciudad_provider.dart';
import '../../../providers/georeferencia/departamento/departamento_provider.dart';

class DestinoScreen extends ConsumerStatefulWidget {
  final Function() onDestinoScreenSelected;
  const DestinoScreen({required this.onDestinoScreenSelected, super.key});

  @override
  ConsumerState<DestinoScreen> createState() => _DestinoScreenState();
}

class _DestinoScreenState extends ConsumerState<DestinoScreen> {
  OfertaStorage ofertaStorage = OfertaStorage();
  Oferta? oferta;
  UbicacionDestinoStorage ubicacionDestinoStorage = UbicacionDestinoStorage();
  Ubicacion? ubicacion;
  DispositivoStorage dispositivoStorage = DispositivoStorage();
  Dispositivos? dispositivo;
  late maps.GoogleMapController mapController;
  String _mapStyle = '';
  late maps.LatLng _currentPosition = const maps.LatLng(37.7749, -122.4194);
  final TextEditingController _searchController = TextEditingController();
  late places.FlutterGooglePlacesSdk _places;
  Set<maps.Marker> markers = {};
  bool _isLoading = false;

  final TextEditingController nombreCiudadController = TextEditingController();
  final TextEditingController departamentoController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController quienEntregaController = TextEditingController();

  DepartamentoStorage departamentoStorage = DepartamentoStorage();

  @override
  void initState() {
    super.initState();
    _places = places.FlutterGooglePlacesSdk(dotenv.env['API_KEY_MAPS']!);
    _loadMapStyle();
    _getCurrentPosition();

    // Cargar los departamentos cuando se inicialice la pantalla
    final departamentoNotifier = ref.read(departamentoProvider.notifier);
    departamentoNotifier
        .getDepartamentoByIdPais(42); // Cambia el ID según corresponda
  }

  Future<Map<String, String>> _getAddressFromLatLng(maps.LatLng latLng) async {
    final Dio dio = Dio();
    final apiKey = dotenv.env['API_KEY_MAPS'];
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latLng.latitude},${latLng.longitude}&key=$apiKey';

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        final addressComponents = data['results'][0]['address_components'];

        String streetNumber = '';
        String ciudad = '';
        String route = '';
        String departamento = '';

        for (var component in addressComponents) {
          final types = component['types'];

          if (types.contains('street_number')) {
            streetNumber = component['long_name'];
          }

          if (types.contains('route')) {
            route = component['long_name'];
          }

          if (types.contains('locality') ||
              types.contains('administrative_area_level_2')) {
            ciudad = component['long_name'];
          }

          if (types.contains('administrative_area_level_1')) {
            departamento = component['long_name'];
          }
        }

        if (streetNumber.isEmpty) streetNumber = 'Dirección no disponible';
        if (ciudad.isEmpty) ciudad = 'Ciudad no disponible';
        if (departamento.isEmpty) departamento = 'Departamento no disponible';

        return {
          'direccion': '$route $streetNumber',
          'ciudad': ciudad,
          'departamento': departamento
        };
      } else {
        throw Exception('Failed to load address');
      }
    } catch (e) {
      print('Error: $e');
      return {
        'direccion': 'Dirección desconocida',
        'ciudad': 'Ciudad desconocida',
        'departamento': 'Departamento desconocido',
      };
    }
  }

  String quitarTildes(String texto) {
    const acentos = {
      'á': 'a',
      'é': 'e',
      'í': 'i',
      'ó': 'o',
      'ú': 'u',
      'Á': 'A',
      'É': 'E',
      'Í': 'I',
      'Ó': 'O',
      'Ú': 'U'
    };

    return texto.split('').map((letra) => acentos[letra] ?? letra).join('');
  }

  Future<Departamento?> buscarDepartamento(String nombreDeprtamento) async {
    List<Departamento?> lista = await departamentoStorage.getList();
    nombreDeprtamento =
        (nombreDeprtamento == "Bogotá") ? "Bogotá D.C." : nombreDeprtamento;

    for (var departamento in lista) {
      if (departamento != null && departamento.nombre == nombreDeprtamento) {
        return departamento;
      }
    }

    return null;
  }

  Future<Ciudad?> obtenerCiudad(String ciudad) async {
    final ciudades = ref.watch(ciudadProvider);
    ciudad = (ciudad == "Bogotá") ? "BOGOTÁ, D.C." : ciudad;
    for (var itemCiudad in ciudades) {
      // Convertir ambas cadenas a minúsculas antes de compararlas
      if (quitarTildes(itemCiudad.nombre.toLowerCase()) ==
          quitarTildes(ciudad.toLowerCase())) {
        return itemCiudad;
      }
    }

    return null;
  }

  Future<void> _onMapTapped(maps.LatLng latLng) async {
    setState(() {
      _isLoading = true; // Establece el estado de carga a true
    });

    // Obtener la dirección basada en las coordenadas
    final address = await _getAddressFromLatLng(latLng);

    // ignore: deprecated_member_use

    // Buscar el departamento basado en la dirección obtenida
    Departamento? departamento =
        await buscarDepartamento(address['departamento']!);

    if (departamento != null && departamento.id != null) {
      final ciudadNotifier = ref.read(ciudadProvider.notifier);
      await ciudadNotifier.getCiudadByIdDepartamento(departamento.id!);

      // Intentar obtener la ciudad por nombre
      Ciudad? ciudad = await obtenerCiudad(address['ciudad']!);

      // Actualizar o añadir el marcador con el infoWindow actualizado
      setState(() {
        // Si ya hay un marcador con el mismo ID, simplemente se actualiza
        markers.removeWhere(
            (m) => m.markerId == const maps.MarkerId('selected_location'));

        markers.add(
          maps.Marker(
            markerId: const maps.MarkerId('selected_location'),
            position: latLng,
            zIndex: 2,
            infoWindow: const maps.InfoWindow(
              title: 'Ubicación seleccionada',
              snippet:
                  'Toca para más detalles', // Muestra un texto corto en el infoWindow
            ),
            icon: maps.BitmapDescriptor.defaultMarkerWithHue(
              maps.BitmapDescriptor.hueAzure,
              // Cambia el color del marcador a azul
            ),
          ),
        );
      });

      // Mostrar el diálogo con la información
      _showSaveDialog(latLng, address['direccion']!, departamento, ciudad);
    } else {
      print('No se encontró el departamento: ${address['departamento']}');
    }
    setState(() {
      _isLoading =
          false; // Establece el estado de carga a false después de completar la carga
    });
  }

  void _showLocationServiceDisabledDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Servicios de ubicación deshabilitados'),
          content: const Text(
              'Por favor, habilita los servicios de ubicación en la configuración del dispositivo.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Abre la configuración para habilitar el servicio de ubicación
                AppSettings.openLocationSettings();
              },
              child: const Text('Abrir configuración'),
            ),
          ],
        );
      },
    );
  }

  // Diálogo cuando el permiso es denegado
  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Permiso de ubicación denegado'),
          content: const Text(
              'Necesitamos el permiso de ubicación para continuar. Por favor, otorga el permiso.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Abre la configuración para habilitar permisos de ubicación
                AppSettings.openAppSettings();
              },
              child: const Text('Abrir configuración'),
            ),
          ],
        );
      },
    );
  }

  // Diálogo cuando el permiso está permanentemente denegado
  void _showPermissionDeniedForeverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Permiso de ubicación permanentemente denegado'),
          content: const Text(
              'Los permisos de ubicación están permanentemente denegados. Por favor, ve a la configuración para habilitarlos manualmente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Abre la configuración para permitir permisos de ubicación
                AppSettings.openAppSettings();
              },
              child: const Text('Abrir configuración'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    oferta = await ofertaStorage.get();

    // Verifica si el servicio de ubicación está habilitado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showLocationServiceDisabledDialog();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showPermissionDeniedDialog();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showPermissionDeniedForeverDialog();
      return;
    }

    // Si se tienen los permisos, obtener la ubicación
    try {
      Position position;
      maps.LatLng targetPosition;
      String direccion = '';

      if (oferta?.ubicacionOrigen != null) {
        // Si ya tienes una ubicación, úsala
        final ubicacionOrigen = oferta!.ubicacionOrigen!;
        targetPosition = maps.LatLng(
          double.parse(ubicacionOrigen.latitud!),
          double.parse(ubicacionOrigen.longitud!),
        );
        direccion = ubicacionOrigen.direccion!;
      } else {
        // Obtener la posición actual
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        targetPosition = maps.LatLng(position.latitude, position.longitude);

        // Obtener dirección basada en las coordenadas
        final address = await _getAddressFromLatLng(targetPosition);
        direccion = address['direccion']!;
      }

      // Actualizar la posición actual
      setState(() {
        _currentPosition = targetPosition;
      });

      // Animar la cámara hacia la posición objetivo
      mapController.animateCamera(
        maps.CameraUpdate.newLatLng(_currentPosition),
      );

      // Buscar departamento y ciudad
      final address = await _getAddressFromLatLng(_currentPosition);
      Departamento? departamento =
          await buscarDepartamento(address['departamento']!);
      Ciudad? ciudad = await obtenerCiudad(address['ciudad']!);

      // Actualizar los campos del formulario
      setState(() {
        nombreCiudadController.text = ciudad?.nombre ?? '';
        departamentoController.text = departamento?.nombre ?? '';
        direccionController.text = direccion;
        quienEntregaController.text = oferta!.nombreEntrega;
      });

      // Agregar marcador si oferta no es nulo
      if (oferta!.ubicacionOrigen != null) {
        setState(() {
          markers.add(
            maps.Marker(
              markerId: const maps.MarkerId('selected_location'),
              position: _currentPosition,
              zIndex: 2,
              infoWindow: maps.InfoWindow(
                title: 'Ubicación seleccionada',
                snippet: direccion.isNotEmpty
                    ? direccion
                    : 'Toca para más detalles', // Dirección o texto alternativo
              ),
              icon: maps.BitmapDescriptor.defaultMarkerWithHue(
                maps.BitmapDescriptor.hueAzure,
              ),
            ),
          );
          mapController.animateCamera(
            maps.CameraUpdate.newLatLng(_currentPosition),
          );
        });
      }
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void _loadMapStyle() async {
    _mapStyle = await rootBundle.loadString('assets/map_style.json');
  }

  void _onMapCreated(maps.GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);

    // Llamar a la función para obtener la posición actual y animar la cámara
    _getCurrentPosition();
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

  void saveDestino() async {
    oferta = await ofertaStorage.get();
    ubicacion = await ubicacionDestinoStorage.get();

    await ubicacionDestinoStorage
        .save(ubicacion!.copyWith(direccion: direccionController.text));
    ubicacion = await ubicacionDestinoStorage.get();

    if (oferta != null) {
      await ofertaStorage.save(oferta!.copyWith(
        nombreEntrega: quienEntregaController.text,
        ubicacionOrigen: ubicacion,
        ubicacionOrigenId: ubicacion!.id,
      ));
    }
    widget.onDestinoScreenSelected();
    // ignore: use_build_context_synchronously
    FocusScope.of(context).unfocus();
  }

  void _showSaveDialog(maps.LatLng latLng, String direccion,
      Departamento? departamento, Ciudad? ciudad) async {
    nombreCiudadController.text = ciudad?.nombre ?? '';
    departamentoController.text = departamento?.nombre ?? '';
    direccionController.text = direccion;
    ubicacion = await ubicacionDestinoStorage.get();
    dispositivo = await dispositivoStorage.get();
    ubicacionDestinoStorage.save(Ubicacion(
      ciudadId: ciudad!.id,
      departamentoId: departamento!.id,
      direccion: direccion,
      dispositivoId: dispositivo!.id,
      fechaHora: DateTime.now(),
      latitud: latLng.latitude.toString(),
      longitud: latLng.longitude.toString(),
      nombreCiudad: ciudad.nombre,
      nombreDepartamento: departamento.nombre,
    ));
  }

  @override
  Widget build(BuildContext context) {
    saveDepartamentos();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccione el destino'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              if (!_isLoading)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                TextField(
                                  controller: TextEditingController(
                                    text:
                                        "${departamentoController.text}, ${nombreCiudadController.text}",
                                  ),
                                  decoration: const InputDecoration(
                                    labelText: 'Departamento y Ciudad',
                                  ),
                                  enabled: false,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  controller: direccionController,
                                  decoration: const InputDecoration(
                                    labelText: 'Dirección',
                                  ),
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  controller: quienEntregaController,
                                  decoration: const InputDecoration(
                                    labelText: 'Quien Recibe',
                                  ),
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: ElevatedButton(
                                onPressed: () {
                                  saveDestino();

                                  // Lógica del botón de aceptar
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 10.0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: const Text('Aceptar'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 8),
              Expanded(
                child: Material(
                  elevation: 6, // Elevación para darle sombra al mapa
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 15.0,
                    ), // Margen externo del mapa
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: maps.GoogleMap(
                        onTap: _onMapTapped,
                        markers: markers,
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: maps.CameraPosition(
                          target: _currentPosition,
                          zoom: 12.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  Future<void> saveDepartamentos() async {
    final departamentos = ref.watch(departamentoProvider);
    await departamentoStorage.saveList(departamentos);
  }
}
