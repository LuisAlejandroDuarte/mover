import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/domain.dart';
import 'package:go_router/go_router.dart';
import '../../../../utils/storage/storagex.dart';
import '../../../providers/providers.dart';
import '../../screen.dart';

class CarroceriaScreen extends ConsumerStatefulWidget {
  final Function(int?) onCarroceriaSelected;
  const CarroceriaScreen({required this.onCarroceriaSelected, super.key});

  @override
  CarroceriaScreenState createState() => CarroceriaScreenState();
}

class CarroceriaScreenState extends ConsumerState<CarroceriaScreen> {
  VehiculoStorage vehiculoStorage = VehiculoStorage();
  VehiculoListStorage vehiculoListStorage = VehiculoListStorage();

  Vehiculo? vehiculo;
  List<Vehiculo?>? listVehiculo;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeData();
  }

  Future<void> _initializeData() async {
    vehiculo = await vehiculoStorage.get();
    if (mounted && vehiculo?.claseId != null) {
      ref
          .read(carroceriaProvider.notifier)
          .getCarroceriaByIdClase(vehiculo!.claseId!);
    }
  }

  Future<void> _handleCarroceriaTap(Carroceria carroceria) async {
    vehiculo = await vehiculoStorage.get();
    listVehiculo = await vehiculoListStorage.getList();

    int index =
        listVehiculo?.indexWhere((element) => element?.id == vehiculo?.id) ??
            -1;

    Vehiculo updatedVehiculo = vehiculo?.copyWith(
          carroceriaId: carroceria.id,
          nombreCarroceria: carroceria.nombre,
        ) ??
        Vehiculo(
          carroceriaId: carroceria.id,
          nombreCarroceria: carroceria.nombre,
        );

    await vehiculoStorage.save(updatedVehiculo);

    if (index >= 0) {
      listVehiculo![index] = updatedVehiculo;
      await vehiculoListStorage.saveList(listVehiculo!);
    }

    widget.onCarroceriaSelected(carroceria.id);
  }

  @override
  Widget build(BuildContext context) {
    final carroceriaAsync = ref.watch(carroceriaProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      carroceriaAsync.when(
        data: (_) => LoadingScreen.hide(),
        loading: () => LoadingScreen.show(context),
        error: (_, __) => LoadingScreen.hide(),
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccione carrocería',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pushReplacement('/mainoferta', extra: {'initialIndex': 1});
          },
        ),
      ),
      body: carroceriaAsync.when(
        data: (carroceriaList) {
          if (vehiculo != null) {
            carroceriaList.sort((a, b) => a.id == vehiculo!.carroceriaId
                ? -1
                : 1); // Priorizar seleccionado
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: carroceriaList.length,
            itemBuilder: (context, index) {
              final carroceria = carroceriaList[index];
              final isSelected =
                  vehiculo != null && carroceria.id == vehiculo!.carroceriaId;

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
                      carroceria.nombre,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                  onTap: () => _handleCarroceriaTap(carroceria),
                ),
              );
            },
          );
        },
        loading: () => const SizedBox.shrink(),
        error: (_, __) => const Center(child: Text('Error al cargar datos')),
      ),
    );
  }
}
