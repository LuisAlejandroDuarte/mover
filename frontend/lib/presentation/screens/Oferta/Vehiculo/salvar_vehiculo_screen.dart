import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../domain/domain.dart';
import '../../../../utils/storage/parametros_vehiculo_storage.dart';
import '../../../../utils/storage/storagex.dart';

class SalvarVehiculoScreen extends StatefulWidget {
  final Function() onClicSaveVehiculo;
  const SalvarVehiculoScreen({required this.onClicSaveVehiculo, super.key});

  @override
  SalvarVehiculoScreenState createState() => SalvarVehiculoScreenState();
}

class SalvarVehiculoScreenState extends State<SalvarVehiculoScreen> {
  MultimediaVehiculoListStorage multimediaVehiculoListStorage =
      MultimediaVehiculoListStorage();
  List<MultimediaVehiculo?>? listMultimediaVehiculo;
  List<MultimediaVehiculo?>? addListMultimediaVehiculo = [];
  VehiculoStorage vehiculoStorage = VehiculoStorage();
  VehiculoListStorage vehiculoListStorage = VehiculoListStorage();
  ParametrosVehiculoStorage parametrosVehiculoStorage =
      ParametrosVehiculoStorage();
  List<ParametrosVehiculo>? listParametrosVehiculo;
  Vehiculo? vehiculo;
  Vehiculo? newVehiculo;
  List<Vehiculo?>? listVehiculo;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadVehiculo();
  }

  Future<void> _loadVehiculo() async {
    vehiculo = await vehiculoStorage.get();
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void gotoOferta() async {
    // Obtener las listas necesarias
    listVehiculo = await vehiculoListStorage.getList();
    vehiculo = await vehiculoStorage.get();
    listMultimediaVehiculo = await multimediaVehiculoListStorage.getList();

    // Buscar si el vehículo ya está en la lista
    int index =
        listVehiculo!.indexWhere((element) => element!.id == vehiculo!.id);

    if (index != -1) {
      // Si se encuentra, actualizarlo
      listVehiculo![index] = vehiculo!;
    } else {
      // Generar un nuevo ID para el vehículo si no está en la lista
      int idVehiculo =
          listVehiculo!.isEmpty ? -1 : (listVehiculo!.length * -1) - 1;

      // Crear una nueva instancia del vehículo
      newVehiculo = vehiculo!.copyWith(
        id: idVehiculo,
        multimediaVehiculo: [...listMultimediaVehiculo!],
      );

      // Agregar el nuevo vehículo a la lista
      listVehiculo!.add(newVehiculo);
    }
    await vehiculoListStorage.saveList(listVehiculo!);

    // Notificar el guardado del vehículo
    widget.onClicSaveVehiculo();
  }

  Future<void> loadParametrosVehiculoStorage() async {
    listParametrosVehiculo = await parametrosVehiculoStorage.getList();
  }

  @override
  Widget build(BuildContext context) {
    loadParametrosVehiculoStorage();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información del vehículo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            context.pushReplacement('/mainoferta', extra: {'initialIndex': 1});
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : vehiculo != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(vehiculo!.nombreCategoria ?? 'Sin Categoria',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(vehiculo!.nombreClase ?? 'Sin Clase',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(vehiculo!.nombreCarroceria ?? 'Sin Carroceria',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(vehiculo!.nombreMarca ?? 'Sin Marca',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(vehiculo!.nombreReferencia ?? 'Sin Referencia',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(vehiculo!.nombreModelo ?? 'Sin Modelo',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 20),
                      Text(vehiculo!.placa,
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(vehiculo!.nombreCondicion!,
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(vehiculo!.nombreEstado!,
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 20),
                      Text('Parámetros del vehículo:',
                          style: Theme.of(context).textTheme.titleMedium),
                      ..._buildParametrosList(
                          vehiculo!.parametrosVehiculo ?? []),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          gotoOferta();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          minimumSize:
                              Size(MediaQuery.of(context).size.width * 0.6, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: const Text(
                          'Guardar',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: Text('No se encontró información del vehículo'),
                  ),
      ),
    );
  }

  List<Widget> _buildParametrosList(List<Map<int, bool>> parametros) {
    // Filtrar solo los elementos donde el valor sea true
    final filteredParametros = parametros
        .expand((map) => map.entries)
        .where((entry) => entry.value) // Filtrar solo los que tienen `true`
        .toList();

    // Crear una lista de Widgets para mostrar los nombres de los parámetros
    return filteredParametros.map((entry) {
      // Buscar el nombre del parámetro en `listParametrosVehiculo`
      final parametro = listParametrosVehiculo?.firstWhere(
          (p) => p.id == entry.key,
          orElse: () => ParametrosVehiculo(id: -1, nombre: "Desconocido"));

      // Mostrar solo el nombre del parámetro si existe y tiene un ID válido
      return parametro != null && parametro.id != -1
          ? Text(
              parametro.nombre,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          : const SizedBox(); // Espacio vacío si no se encuentra un parámetro válido
    }).toList();
  }
}
