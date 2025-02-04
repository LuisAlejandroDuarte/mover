import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/domain.dart';
import 'package:go_router/go_router.dart';
import '../../../../utils/storage/storagex.dart';
import '../../../providers/providers.dart';
import '../../screen.dart';

class CondicionVehiculoScreen extends ConsumerStatefulWidget {
  final Function() onCondicionVehiculoSelected;

  const CondicionVehiculoScreen({
    required this.onCondicionVehiculoSelected,
    super.key,
  });

  @override
  CondicionVehiculoScreenState createState() => CondicionVehiculoScreenState();
}

class CondicionVehiculoScreenState
    extends ConsumerState<CondicionVehiculoScreen> {
  String? selectedCondicionVehiculo;
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.microtask(() async {
      vehiculo = await vehiculoStorage.get();
      if (mounted) {
        ref.read(condicionVehiculoProvider.notifier).getAllCondicionVehiculo();
      }
    });
  }

  Future<void> _handleCondicionVehiculoTap(
      CondicionVehiculo condicionVehiculo) async {
    vehiculo = await vehiculoStorage.get();
    listVehiculo = await vehiculoListStorage.getList();

    int index =
        listVehiculo?.indexWhere((element) => element?.id == vehiculo?.id) ??
            -1;

    Vehiculo updatedVehiculo = vehiculo?.copyWith(
          condicionVehiculoId: condicionVehiculo.id,
          nombreCondicion: condicionVehiculo.nombre,
        ) ??
        Vehiculo(
          condicionVehiculoId: condicionVehiculo.id,
          nombreCondicion: condicionVehiculo.nombre,
        );

    await vehiculoStorage.save(updatedVehiculo);

    if (index >= 0) {
      listVehiculo![index] = updatedVehiculo;
      await vehiculoListStorage.saveList(listVehiculo!);
    }

    await loadVehiculo();
    widget.onCondicionVehiculoSelected();
  }

  @override
  Widget build(BuildContext context) {
    final condicionVehiculoList = ref.watch(condicionVehiculoProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      condicionVehiculoList.when(
        data: (_) => LoadingScreen.hide(),
        loading: () => LoadingScreen.show(context),
        error: (_, __) => LoadingScreen.hide(),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccione Condición Vehiculo',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            context.pushReplacement('/mainoferta', extra: {'initialIndex': 1});
          },
        ),
      ),
      body: condicionVehiculoList.when(
        data: (list) {
          if (vehiculo != null) {
            final selectedIndex = list.indexWhere(
              (condicion) => condicion.id == vehiculo!.condicionVehiculoId,
            );

            if (selectedIndex != -1) {
              final selectedItem = list.removeAt(selectedIndex);
              list.insert(0, selectedItem); // Mover al inicio
            }
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              bool isSelected = vehiculo != null &&
                  list[index].id == vehiculo!.condicionVehiculoId;

              return Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color:
                        isSelected ? Colors.grey.shade300 : Colors.transparent,
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
                      list[index].nombre,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedCondicionVehiculo = list[index].nombre;
                      _handleCondicionVehiculoTap(list[index]);
                    });
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
