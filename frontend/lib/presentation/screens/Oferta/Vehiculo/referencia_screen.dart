import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/domain.dart';
import 'package:frontend/utils/storage/storagex.dart';
import 'package:go_router/go_router.dart';
import '../../../providers/providers.dart';

class ReferenciaScreen extends ConsumerStatefulWidget {
  final Function(int? index) onReferenciaSelected;
  const ReferenciaScreen({super.key, required this.onReferenciaSelected});

  @override
  ReferenciaScreenState createState() => ReferenciaScreenState();
}

class ReferenciaScreenState extends ConsumerState<ReferenciaScreen> {
  String? selectedReferencia;
  VehiculoStorage vehiculoStorage = VehiculoStorage();
  Vehiculo? vehiculo;
  VehiculoListStorage vehiculoListStorage = VehiculoListStorage();
  List<Vehiculo?>? listVehiculo;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    vehiculo = await vehiculoStorage.get();
    // Llamar al método para obtener las clases usando el Provider después de montar el widget
    if (mounted) {
      ref
          .read(referenciaProvider.notifier)
          .getReferenciaByIdClase(vehiculo!.marcaId!);
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

  Future<void> _handleReferenciaTap(Referencia referencia) async {
    vehiculo = await vehiculoStorage.get();
    listVehiculo = await vehiculoListStorage.getList();

    int index =
        listVehiculo?.indexWhere((element) => element?.id == vehiculo?.id) ??
            -1;

    Vehiculo updatedVehiculo = vehiculo?.copyWith(
            referenciaId: referencia.id, nombreReferencia: referencia.nombre) ??
        Vehiculo(
            referenciaId: referencia.id, nombreReferencia: referencia.nombre);

    await vehiculoStorage.save(updatedVehiculo);

    if (index >= 0) {
      listVehiculo![index] = updatedVehiculo;
      await vehiculoListStorage.saveList(listVehiculo!);
    }

    await loadVehiculo();
    widget.onReferenciaSelected(referencia.id);
  }

  @override
  Widget build(BuildContext context) {
    final referenciaList = ref.watch(referenciaProvider);

    if (vehiculo != null) {
      final selectedIndex = referenciaList.indexWhere(
        (referencia) => referencia.id == vehiculo!.referenciaId,
      );

      if (selectedIndex != -1) {
        final selectedItem = referenciaList.removeAt(selectedIndex);
        referenciaList.insert(0, selectedItem); // Mover al inicio
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccione referencia',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            context.pushReplacement('/mainoferta', extra: {'initialIndex': 1});
          },
        ),
      ),
      body: referenciaList.isEmpty
          ? const Center(
              child:
                  CircularProgressIndicator()) // Mostrar un indicador mientras carga
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true, // Ajustar el tamaño de la lista a su contenido
              itemCount: referenciaList.length,
              itemBuilder: (context, index) {
                bool isSelected = vehiculo != null &&
                    referenciaList[index].id == vehiculo!.referenciaId;

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
                        referenciaList[index].nombre,
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
                        selectedReferencia = referenciaList[index].nombre;
                        _handleReferenciaTap(referenciaList[index]);
                        //  final categoryId = claseList[index].id;
                        // context.push('/clases/$categoryId');
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
