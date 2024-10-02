import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/entities/vehiculo.dart';
import '../../../utils/storage/storagex.dart';
import '../../providers/providers.dart';

class ModeloScreen extends ConsumerStatefulWidget {
  const ModeloScreen({super.key});

  @override
  ModeloScreenState createState() => ModeloScreenState();
}

class ModeloScreenState extends ConsumerState<ModeloScreen> {
  String? selectedModelo;
  VehiculoStorage vehiculoStorage = VehiculoStorage();
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(modeloProvider.notifier).getAllModelo();
    });
  }

  Future<void> _handleModeloTap(int? modeloId) async {
    Vehiculo? vehiculo = await vehiculoStorage.get();
    if (vehiculo != null) {
      await vehiculoStorage.save(Vehiculo(
          categoriaId: vehiculo.categoriaId,
          modeloId: modeloId,
          claseId: vehiculo.claseId,
          condicionVehiculoId: vehiculo.condicionVehiculoId,
          estadoVehiculoId: vehiculo.estadoVehiculoId,
          id: vehiculo.id,
          marcaId: vehiculo.marcaId,
          carroceriaId: vehiculo.carroceriaId,
          observacion: vehiculo.observacion,
          ofertaId: vehiculo.ofertaId,
          placa: vehiculo.placa,
          referenciaId: vehiculo.referenciaId));
    } else {
      await vehiculoStorage.save(Vehiculo(modeloId: modeloId));
    }
    // Ignora el contexto sincrónico
  }

  @override
  Widget build(BuildContext context) {
    final modeloList = ref.watch(modeloProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccione modelo',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
      body: modeloList.isEmpty
          ? const Center(
              child:
                  CircularProgressIndicator()) // Mostrar un indicador mientras carga
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true, // Ajustar el tamaño de la lista a su contenido
              itemCount: modeloList.length,
              itemBuilder: (context, index) {
                final isSelected = modeloList[index].nombre == selectedModelo;

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
                        modeloList[index].nombre,
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
                        selectedModelo = modeloList[index].nombre;
                        //  final categoryId = claseList[index].id;
                        context.push('/placa');
                        _handleModeloTap(modeloList[index].id);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
