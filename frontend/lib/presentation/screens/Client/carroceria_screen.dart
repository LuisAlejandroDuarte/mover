import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/entities/vehiculo.dart';
import '../../../utils/storage/storagex.dart';
import '../../providers/providers.dart';

class CarroceriaScreen extends ConsumerStatefulWidget {
  final int claseId;

  const CarroceriaScreen({super.key, required this.claseId});

  @override
  CarroceriaScreenState createState() => CarroceriaScreenState();
}

class CarroceriaScreenState extends ConsumerState<CarroceriaScreen> {
  String? selectedCarroceria;
  VehiculoStorage vehiculoStorage = VehiculoStorage();
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(carroceriaProvider.notifier)
          .getCarroceriaByIdClase(widget.claseId);
    });
  }

  Future<void> _handleCarroceriaTap(int? carroceriaId) async {
    Vehiculo? vehiculo = await vehiculoStorage.get();
    if (vehiculo != null) {
      await vehiculoStorage.save(Vehiculo(
          categoriaId: vehiculo.categoriaId,
          carroceriaId: carroceriaId,
          claseId: vehiculo.claseId,
          condicionVehiculoId: vehiculo.condicionVehiculoId,
          estadoVehiculoId: vehiculo.estadoVehiculoId,
          id: vehiculo.id,
          marcaId: vehiculo.marcaId,
          modeloId: vehiculo.modeloId,
          observacion: vehiculo.observacion,
          ofertaId: vehiculo.ofertaId,
          placa: vehiculo.placa,
          referenciaId: vehiculo.referenciaId));
    } else {
      await vehiculoStorage.save(Vehiculo(carroceriaId: carroceriaId));
    }
    // Ignora el contexto sincrónico
    if (context.mounted) {
      final int? claseId = vehiculo!.claseId;
      // ignore: use_build_context_synchronously
      context.push('/marca/$claseId');
    }
  }

  @override
  Widget build(BuildContext context) {
    final carroceriaList = ref.watch(carroceriaProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccione carroceria',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
      body: carroceriaList.isEmpty
          ? const Center(
              child:
                  CircularProgressIndicator()) // Mostrar un indicador mientras carga
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true, // Ajustar el tamaño de la lista a su contenido
              itemCount: carroceriaList.length,
              itemBuilder: (context, index) {
                final isSelected =
                    carroceriaList[index].nombre == selectedCarroceria;

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
                        carroceriaList[index].nombre,
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
                        selectedCarroceria = carroceriaList[index].nombre;
                        //  final categoryId = claseList[index].id;
                        // context.push('/clases/$categoryId');
                        _handleCarroceriaTap(carroceriaList[index].id);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
