import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/entities/vehiculo.dart';
import '../../../utils/storage/storagex.dart';
import '../../providers/providers.dart';

class EstadoVehiculoScreen extends ConsumerStatefulWidget {
  const EstadoVehiculoScreen({super.key});

  @override
  EstadoVehiculoScreenState createState() => EstadoVehiculoScreenState();
}

class EstadoVehiculoScreenState extends ConsumerState<EstadoVehiculoScreen> {
  String? selectedEstadoVehiculo;
  VehiculoStorage vehiculoStorage = VehiculoStorage();
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(estadoVehiculoProvider.notifier).getAllEstadoVehiculo();
    });
  }

  Future<void> _handleEstadoVehiculoTap(int? estadoVehiculoId) async {
    Vehiculo? vehiculo = await vehiculoStorage.get();
    if (vehiculo != null) {
      await vehiculoStorage.save(Vehiculo(
          categoriaId: vehiculo.categoriaId,
          estadoVehiculoId: estadoVehiculoId,
          claseId: vehiculo.claseId,
          carroceriaId: vehiculo.carroceriaId,
          condicionVehiculoId: vehiculo.condicionVehiculoId,
          id: vehiculo.id,
          marcaId: vehiculo.marcaId,
          modeloId: vehiculo.modeloId,
          observacion: vehiculo.observacion,
          ofertaId: vehiculo.ofertaId,
          placa: vehiculo.placa,
          referenciaId: vehiculo.referenciaId));
    } else {
      await vehiculoStorage.save(Vehiculo(estadoVehiculoId: estadoVehiculoId));
    }
    // Ignora el contexto sincrónico
    if (context.mounted) {
      // ignore: use_build_context_synchronously
      context.push('/parametrosvehiculo');
    }
  }

  @override
  Widget build(BuildContext context) {
    final estadoVehiculoList = ref.watch(estadoVehiculoProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccione Estado Vehiculo',
          style: Theme.of(context).textTheme.labelSmall,
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
                final isSelected =
                    estadoVehiculoList[index].nombre == selectedEstadoVehiculo;

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
                        _handleEstadoVehiculoTap(estadoVehiculoList[index].id);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
