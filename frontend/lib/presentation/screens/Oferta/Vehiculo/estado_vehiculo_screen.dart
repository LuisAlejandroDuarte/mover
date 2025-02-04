import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/domain.dart';
import 'package:go_router/go_router.dart';
import '../../../../utils/storage/storagex.dart';
import '../../../providers/providers.dart';

class EstadoVehiculoScreen extends ConsumerStatefulWidget {
  final Function() onSelectedEstado;
  const EstadoVehiculoScreen({required this.onSelectedEstado, super.key});

  @override
  EstadoVehiculoScreenState createState() => EstadoVehiculoScreenState();
}

class EstadoVehiculoScreenState extends ConsumerState<EstadoVehiculoScreen> {
  String? selectedEstadoVehiculo;
  VehiculoStorage vehiculoStorage = VehiculoStorage();
  Vehiculo? vehiculo;
  VehiculoListStorage vehiculoListStorage = VehiculoListStorage();
  List<Vehiculo?>? listVehiculo;

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

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    vehiculo = await vehiculoStorage.get();
    if (mounted) {
      ref.read(estadoVehiculoProvider.notifier).getAllEstadoVehiculo();
    }
  }

  Future<void> _handleEstadoVehiculoTap(EstadoVehiculo estadoVehiculo) async {
    vehiculo = await vehiculoStorage.get();
    listVehiculo = await vehiculoListStorage.getList();

    int index =
        listVehiculo?.indexWhere((element) => element?.id == vehiculo?.id) ??
            -1;

    Vehiculo updatedVehiculo = vehiculo?.copyWith(
          estadoVehiculoId: estadoVehiculo.id,
          nombreEstado: estadoVehiculo.nombre,
        ) ??
        Vehiculo(
          estadoVehiculoId: estadoVehiculo.id,
          nombreEstado: estadoVehiculo.nombre,
        );

    await vehiculoStorage.save(updatedVehiculo);

    if (index >= 0) {
      listVehiculo![index] = updatedVehiculo;
      await vehiculoListStorage.saveList(listVehiculo!);
    }
    await loadVehiculo();
    widget.onSelectedEstado();
  }

  @override
  Widget build(BuildContext context) {
    final estadoVehiculoList = ref.watch(estadoVehiculoProvider);
    if (vehiculo != null) {
      final selectedIndex = estadoVehiculoList.indexWhere(
        (estado) => estado.id == vehiculo!.estadoVehiculoId,
      );

      if (selectedIndex != -1) {
        final selectedItem = estadoVehiculoList.removeAt(selectedIndex);
        estadoVehiculoList.insert(0, selectedItem); // Mover al inicio
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccione Estado Vehiculo',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            context.pushReplacement('/mainoferta', extra: {'initialIndex': 1});
          },
        ),
      ),
      body: estadoVehiculoList.isEmpty
          ? const Center(
              child:
                  CircularProgressIndicator()) // Mostrar un indicador mientras carga
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true, // Ajustar el tamaño de la lista a su contenido
              itemCount: estadoVehiculoList.length,
              itemBuilder: (context, index) {
                bool isSelected = vehiculo != null &&
                    estadoVehiculoList[index].id == vehiculo!.estadoVehiculoId;

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
                  color: isSelected ? Colors.grey.shade200 : Colors.white,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 16.0),
                    title: Center(
                      // Centrar el texto
                      child: Text(
                        estadoVehiculoList[index].nombre,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary, // Usar color primario en todos los textos
                                ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedEstadoVehiculo =
                            estadoVehiculoList[index].nombre;
                        //  final categoryId = claseList[index].id;
                        // context.push('/clases/$categoryId');
                        _handleEstadoVehiculoTap(estadoVehiculoList[index]);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
