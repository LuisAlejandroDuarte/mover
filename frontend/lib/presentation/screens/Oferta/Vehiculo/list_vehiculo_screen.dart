import 'package:flutter/material.dart';
import 'package:frontend/domain/entities/vehiculo.dart';
import 'package:go_router/go_router.dart';
import 'dart:io';
import '../../../../utils/storage/storagex.dart';

class ListVehiculoScreen extends StatefulWidget {
  const ListVehiculoScreen({super.key});

  @override
  ListVehiculoScreenState createState() => ListVehiculoScreenState();
}

class ListVehiculoScreenState extends State<ListVehiculoScreen> {
  VehiculoStorage vehiculoStorage = VehiculoStorage();
  MultimediaVehiculoListStorage multimediaVehiculoListStorage =
      MultimediaVehiculoListStorage();
  VehiculoListStorage vehiculoListStorage = VehiculoListStorage();

  List<Vehiculo?> vehiculos = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    List<Vehiculo?> vehiculosCargados = await vehiculoListStorage.getList();
    setState(() {
      vehiculos = vehiculosCargados;
    });
  }

  Future<void> eliminarVehiculo(int index) async {
    Vehiculo? vehiculoAEliminar = vehiculos[index];

    // Eliminación de la lista y almacenamiento
    setState(() {
      vehiculos.removeAt(index);
    });
    await vehiculoStorage.delete();
    await vehiculoListStorage.saveList(vehiculos);

    // También puedes eliminar archivos multimedia relacionados, si es necesario
    if (vehiculoAEliminar?.multimediaVehiculo != null) {
      for (var multimedia in vehiculoAEliminar!.multimediaVehiculo!) {
        await File(multimedia!.link).delete();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de vehículos',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: vehiculos.isEmpty
          ? Center(
              child: Text(
                'No hay vehículos registrados.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          : ListView.builder(
              itemCount: vehiculos.length,
              itemBuilder: (context, index) {
                final vehiculo = vehiculos[index];
                final String? imageUrl = vehiculo?.multimediaVehiculo != null &&
                        vehiculo!.multimediaVehiculo!.isNotEmpty
                    ? vehiculo.multimediaVehiculo!.first!.link
                    : null;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 4.0,
                    child: ListTile(
                      leading: imageUrl != null
                          ? Image.file(
                              File(imageUrl),
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image),
                            )
                          : const Icon(Icons.directions_car),
                      title: Text(
                        vehiculo!.placa,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () async {
                              await vehiculoStorage.save(vehiculo);
                              await multimediaVehiculoListStorage
                                  .saveList(vehiculo.multimediaVehiculo ?? []);
                              // ignore: use_build_context_synchronously
                              context.pushReplacement('/mainvehiculo');
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              final confirm = await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Confirmar eliminación'),
                                  content: const Text(
                                      '¿Estás seguro de que deseas eliminar este vehículo?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      child: const Text('Eliminar',
                                          style: TextStyle(color: Colors.red)),
                                    ),
                                  ],
                                ),
                              );
                              if (confirm == true) {
                                await eliminarVehiculo(index);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await vehiculoStorage.delete();

          int idVehiculo = vehiculos.isEmpty ? -1 : (vehiculos.length * -1) - 1;

          await vehiculoStorage.save(Vehiculo(id: idVehiculo));
          await multimediaVehiculoListStorage.delete();

          // ignore: use_build_context_synchronously
          context.pushReplacement('/mainvehiculo');
        },
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text(
            'Crear vehículo',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        icon: const Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
