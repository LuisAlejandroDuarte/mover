import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/domain.dart';
import 'package:go_router/go_router.dart';
import '../../../../utils/storage/storagex.dart';
import '../../../providers/providers.dart';

class ModeloScreen extends ConsumerStatefulWidget {
  final Function(int? index) onModeloSelected;
  const ModeloScreen({super.key, required this.onModeloSelected});

  @override
  ModeloScreenState createState() => ModeloScreenState();
}

class ModeloScreenState extends ConsumerState<ModeloScreen> {
  String? selectedModelo;
  VehiculoStorage vehiculoStorage = VehiculoStorage();
  Vehiculo? vehiculo;
  VehiculoListStorage vehiculoListStorage = VehiculoListStorage();
  List<Vehiculo?>? listVehiculo;
  @override
  void initState() {
    super.initState();
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
  void didChangeDependencies() async {
    super.didChangeDependencies();
    vehiculo = await vehiculoStorage.get();
    // Llamar al método para obtener las clases usando el Provider después de montar el widget
    if (mounted) {
      ref.read(modeloProvider.notifier).getAllModelo();
    }
  }

  Future<void> _handleModeloTap(Modelo modelo) async {
    vehiculo = await vehiculoStorage.get();
    listVehiculo = await vehiculoListStorage.getList();

    int index =
        listVehiculo?.indexWhere((element) => element?.id == vehiculo?.id) ??
            -1;

    Vehiculo updatedVehiculo = vehiculo?.copyWith(
          modeloId: modelo.id,
          nombreModelo: modelo.nombre,
        ) ??
        Vehiculo(
          modeloId: modelo.id,
          nombreModelo: modelo.nombre,
        );

    await vehiculoStorage.save(updatedVehiculo);

    if (index >= 0) {
      listVehiculo![index] = updatedVehiculo;
      await vehiculoListStorage.saveList(listVehiculo!);
    }
    await loadVehiculo();
    widget.onModeloSelected(modelo.id);
    // Ignora el contexto sincrónico
  }

  @override
  Widget build(BuildContext context) {
    final modeloList = ref.watch(modeloProvider);

    if (vehiculo != null) {
      final selectedIndex = modeloList.indexWhere(
        (modelo) => modelo.id == vehiculo!.modeloId,
      );

      if (selectedIndex != -1) {
        final selectedItem = modeloList.removeAt(selectedIndex);
        modeloList.insert(0, selectedItem); // Mover al inicio
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccione modelo',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            context.pushReplacement('/mainoferta', extra: {'initialIndex': 1});
          },
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
                bool isSelected = vehiculo != null &&
                    modeloList[index].id == vehiculo!.modeloId;

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
                        _handleModeloTap(modeloList[index]);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
