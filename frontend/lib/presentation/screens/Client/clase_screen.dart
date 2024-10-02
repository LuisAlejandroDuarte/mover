import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/entities/vehiculo.dart';
import 'package:frontend/utils/storage/storagex.dart';
import 'package:go_router/go_router.dart';
import '../../providers/clase/clase_provider.dart';

class ClaseScreen extends ConsumerStatefulWidget {
  final int categoriaId;
  const ClaseScreen({super.key, required this.categoriaId});

  @override
  ClaseScreenState createState() => ClaseScreenState();
}

class ClaseScreenState extends ConsumerState<ClaseScreen> {
  String? selectedClase;
  VehiculoStorage vehiculoStorage = VehiculoStorage();
  @override
  void initState() {
    super.initState();
    // Llamar al método para obtener las clases en initState
    Future.microtask(() {
      ref.read(claseProvider.notifier).getClasesByIdCategoria(
          widget.categoriaId); // Usar el ID de la categoría necesario
    });
  }

  Future<void> _handleClaseTap(int? claseId) async {
    Vehiculo? vehiculo = await vehiculoStorage.get();
    if (vehiculo != null) {
      await vehiculoStorage.save(Vehiculo(
          categoriaId: vehiculo.categoriaId,
          carroceriaId: vehiculo.carroceriaId,
          claseId: claseId,
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
      await vehiculoStorage.save(Vehiculo(claseId: claseId));
    }

    // Ignora el contexto sincrónico
    if (context.mounted) {
      // ignore: use_build_context_synchronously
      context.push('/carroceria/$claseId');
    }
  }

  @override
  Widget build(BuildContext context) {
    final claseList = ref.watch(claseProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccione clase',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
      body: claseList.isEmpty
          ? const Center(
              child:
                  CircularProgressIndicator()) // Mostrar un indicador mientras carga
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true, // Ajustar el tamaño de la lista a su contenido
              itemCount: claseList.length,
              itemBuilder: (context, index) {
                final isSelected = claseList[index].nombre == selectedClase;

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
                        claseList[index].nombre,
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
                        selectedClase = claseList[index].nombre;
                        final claseId = claseList[index].id;
                        _handleClaseTap(claseId);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
