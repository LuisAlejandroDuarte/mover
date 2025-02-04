import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/domain.dart';
import 'package:frontend/utils/storage/parametros_vehiculo_Storage.dart';
import 'package:go_router/go_router.dart';
import '../../../../utils/storage/storagex.dart';
import '../../../providers/parametrosvehiculo/parametros_vehiculo_provider.dart';

class ParametrosVehiculoScreen extends ConsumerStatefulWidget {
  final Function() onParametrosVehiculoSelected;
  const ParametrosVehiculoScreen(
      {required this.onParametrosVehiculoSelected, super.key});

  @override
  ParametrosVehiculoScreenState createState() =>
      ParametrosVehiculoScreenState();
}

class ParametrosVehiculoScreenState
    extends ConsumerState<ParametrosVehiculoScreen> {
  // Set para almacenar los IDs seleccionados
  Set<int> selectedParametrosVehiculoIds = {};

  VehiculoStorage vehiculoStorage = VehiculoStorage();
  ParametrosVehiculoStorage parametrosVehiculoStorage =
      ParametrosVehiculoStorage();
  Vehiculo? vehiculo;
  VehiculoListStorage vehiculoListStorage = VehiculoListStorage();
  List<Vehiculo?>? listVehiculo;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    vehiculo = await vehiculoStorage.get();
    // Llamar al método para obtener las clases usando el Provider después de montar el widget
    if (mounted) {
      ref.read(parametrosVehiculoProvider.notifier).fetchParametrosVehiculos();
    }
  }

  Future<void> loadVehiculo() async {
    Vehiculo? loadedVehiculo = await vehiculoStorage.get();
    if (mounted) {
      setState(() {
        vehiculo = loadedVehiculo;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> updateParametrosVehiculo(List<Map<int, bool>> parametros) async {
    vehiculo = await vehiculoStorage.get();

    listVehiculo = await vehiculoListStorage.getList();

    int index =
        listVehiculo?.indexWhere((element) => element?.id == vehiculo?.id) ??
            -1;

    Vehiculo updatedVehiculo = vehiculo?.copyWith(
          parametrosVehiculo: parametros,
        ) ??
        Vehiculo(
          parametrosVehiculo: parametros,
        );

    await vehiculoStorage.save(updatedVehiculo);

    if (index >= 0) {
      listVehiculo![index] = updatedVehiculo;
      await vehiculoListStorage.saveList(listVehiculo!);
    }

    await loadVehiculo();
  }

  Future<void> saveVehiculo(List<Map<int, bool>> parametros) async {
    vehiculo = await vehiculoStorage.get();

    listVehiculo = await vehiculoListStorage.getList();

    int index =
        listVehiculo?.indexWhere((element) => element?.id == vehiculo?.id) ??
            -1;

    Vehiculo updatedVehiculo = vehiculo?.copyWith(
          parametrosVehiculo: parametros,
        ) ??
        Vehiculo(
          parametrosVehiculo: parametros,
        );

    await vehiculoStorage.save(updatedVehiculo);

    if (index >= 0) {
      listVehiculo![index] = updatedVehiculo;
      await vehiculoListStorage.saveList(listVehiculo!);
    }

    await loadVehiculo();
    widget.onParametrosVehiculoSelected();
  }

  Future<void> handleParametrosVehiculoTap(int id, bool value) async {
    vehiculo = await vehiculoStorage.get();

    Map<int, bool>? parametroEncontrado =
        vehiculo!.parametrosVehiculo!.firstWhere((map) => map.containsKey(id));

    parametroEncontrado[id] = value;
    updateParametrosVehiculo(vehiculo!.parametrosVehiculo!);
  }

  Future<void> saveParametrosVehiculo(
      List<ParametrosVehiculo> parametros) async {
    await parametrosVehiculoStorage.saveList(parametros);
  }

  @override
  Widget build(BuildContext context) {
    final parametrosVehiculoList = ref.watch(parametrosVehiculoProvider);

    if (vehiculo != null) {
      if (vehiculo!.parametrosVehiculo == null) {
        final nuevaListaParametros =
            List<Map<int, bool>>.from(vehiculo!.parametrosVehiculo ?? []);

        if (nuevaListaParametros.isEmpty) {
          for (var accion in parametrosVehiculoList) {
            nuevaListaParametros.add({accion.id!: false});
          }
        }

        // Actualizar el objeto vehiculo usando copyWith
        vehiculo = vehiculo!.copyWith(parametrosVehiculo: nuevaListaParametros);

        updateParametrosVehiculo(nuevaListaParametros);
      }
      saveParametrosVehiculo(parametrosVehiculoList);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccione Parâmetros Vehículo',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            context.pushReplacement('/mainoferta', extra: {'initialIndex': 1});
          },
        ),
      ),
      body: parametrosVehiculoList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: parametrosVehiculoList.length,
                    itemBuilder: (context, index) {
                      final parametrosVehiculo = parametrosVehiculoList[index];

                      bool isSelected = false;
                      if (vehiculo != null) {
                        if (vehiculo!.parametrosVehiculo != null) {
                          Map<int, bool>? parametroEncontrado =
                              vehiculo!.parametrosVehiculo!.firstWhere((map) =>
                                  map.containsKey(parametrosVehiculo.id));

                          isSelected =
                              parametroEncontrado[parametrosVehiculo.id] ??
                                  false;
                        }
                      }
                      //vehiculo!.parametrosVehiculo

                      return Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: isSelected
                                ? Colors.grey.shade300
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CheckboxListTile(
                          title: Text(
                            parametrosVehiculo.nombre,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.black,
                                ),
                          ),
                          value: isSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              handleParametrosVehiculoTap(
                                  parametrosVehiculo.id!, value!);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    saveVehiculo(vehiculo!.parametrosVehiculo!);
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
                    'Aceptar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
    );
  }
}
