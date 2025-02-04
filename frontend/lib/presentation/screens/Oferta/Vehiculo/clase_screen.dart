import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/domain.dart';
import 'package:frontend/presentation/screens/screen.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/utils/storage/storagex.dart';
import '../../../providers/clase/clase_provider.dart';

class ClaseScreen extends ConsumerStatefulWidget {
  final Function(int?) onClaseSelected;
  const ClaseScreen({super.key, required this.onClaseSelected});

  @override
  ClaseScreenState createState() => ClaseScreenState();
}

class ClaseScreenState extends ConsumerState<ClaseScreen> {
  String? selectedClase;
  VehiculoStorage vehiculoStorage = VehiculoStorage();
  Vehiculo? vehiculo;
  VehiculoListStorage vehiculoListStorage = VehiculoListStorage();
  List<Vehiculo?>? listVehiculo;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    vehiculo = await vehiculoStorage.get();
    // Llamar al método para obtener las clases usando el Provider después de montar el widget
    if (mounted) {
      ref
          .read(claseProvider.notifier)
          .getClasesByIdCategoria(vehiculo!.categoriaId!);
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

  Future<void> _handleClaseTap(Clases clase) async {
    vehiculo = await vehiculoStorage.get();
    listVehiculo = await vehiculoListStorage.getList();

    int index =
        listVehiculo?.indexWhere((element) => element?.id == vehiculo?.id) ??
            -1;

    Vehiculo updatedVehiculo = vehiculo?.copyWith(
          claseId: clase.id,
          nombreClase: clase.nombre,
        ) ??
        Vehiculo(
          claseId: clase.id,
          nombreClase: clase.nombre,
        );

    await vehiculoStorage.save(updatedVehiculo);

    if (index >= 0) {
      listVehiculo![index] = updatedVehiculo;
      await vehiculoListStorage.saveList(listVehiculo!);
    }

    await loadVehiculo();
    widget.onClaseSelected(clase.id);
  }

  @override
  Widget build(BuildContext context) {
    final claseAsyncValue = ref.watch(claseProvider);

    // Usamos WidgetsBinding para manejar el estado del LoadingOverlay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      claseAsyncValue.when(
        data: (_) => LoadingScreen.hide(),
        loading: () => LoadingScreen.show(context),
        error: (_, __) => LoadingScreen.hide(),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccione clase',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            context.pushReplacement('/mainoferta', extra: {'initialIndex': 1});
          },
        ),
      ),
      body: claseAsyncValue.when(
        data: (claseList) {
          if (vehiculo != null) {
            final selectedIndex = claseList.indexWhere(
              (clase) => clase.id == vehiculo!.claseId,
            );

            if (selectedIndex != -1) {
              final selectedItem = claseList.removeAt(selectedIndex);
              claseList.insert(0, selectedItem); // Mover al inicio
            }
          }

          return claseList.isEmpty
              ? const Center(child: Text('No hay clases disponibles'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  shrinkWrap: true,
                  itemCount: claseList.length,
                  itemBuilder: (context, index) {
                    bool isSelected = vehiculo != null &&
                        claseList[index].id == vehiculo!.claseId;

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
                          child: Text(
                            claseList[index].nombre,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _handleClaseTap(claseList[index]);
                          });
                        },
                      ),
                    );
                  },
                );
        },
        loading: () => const SizedBox.shrink(),
        error: (error, stackTrace) =>
            Center(child: Text('Error al cargar las clases: $error')),
      ),
    );
  }
}
