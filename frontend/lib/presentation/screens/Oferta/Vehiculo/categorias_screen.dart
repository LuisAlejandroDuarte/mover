import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/entities/categoria.dart';
import 'package:frontend/domain/entities/vehiculo.dart';
import 'package:frontend/utils/storage/storagex.dart';
import 'package:go_router/go_router.dart';
import '../../../providers/categoria/categoria_provider.dart';
import '../../screen.dart';

class CategoriasScreen extends ConsumerStatefulWidget {
  final Function(int?) onCategoriaSelected;
  const CategoriasScreen({super.key, required this.onCategoriaSelected});

  @override
  CategoriasScreenState createState() => CategoriasScreenState();
}

class CategoriasScreenState extends ConsumerState<CategoriasScreen> {
  String? selectedCategoria;
  VehiculoStorage vehiculoStorage = VehiculoStorage();
  Vehiculo? vehiculo;
  VehiculoListStorage vehiculoListStorage = VehiculoListStorage();
  List<Vehiculo?>? listVehiculo;

  @override
  void initState() {
    super.initState();
    loadVehiculo();
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
  Widget build(BuildContext context) {
    final categoriasAsyncValue = ref.watch(categoriaProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      categoriasAsyncValue.when(
        data: (_) => LoadingScreen.hide(),
        loading: () => LoadingScreen.show(context),
        error: (_, __) => LoadingScreen.hide(),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccione categoría',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            context.pushReplacement('/mainoferta', extra: {'initialIndex': 1});
          },
        ),
      ),
      body: categoriasAsyncValue.when(
        data: (categorias) {
          if (vehiculo != null) {
            final selectedIndex = categorias.indexWhere(
              (categoria) => categoria.id == vehiculo!.categoriaId,
            );

            if (selectedIndex != -1) {
              final selectedItem = categorias.removeAt(selectedIndex);
              categorias.insert(0, selectedItem); // Mover al inicio
            }
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            shrinkWrap: true,
            itemCount: categorias.length,
            itemBuilder: (context, index) {
              bool isSelected = vehiculo != null &&
                  categorias[index].id == vehiculo!.categoriaId;

              return Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: isSelected ? Colors.blue[400]! : Colors.transparent,
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
                      categorias[index].nombre,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedCategoria = categorias[index].nombre;

                      _handleCategoriaTap(categorias[index]);
                    });
                  },
                ),
              );
            },
          );
        },
        loading: () => const SizedBox.shrink(),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Future<void> _handleCategoriaTap(Categorias category) async {
    try {
      vehiculo = await vehiculoStorage.get();
      if (vehiculo == null) return;

      if (category.id != vehiculo!.categoriaId) {
        listVehiculo = await vehiculoListStorage.getList();

        int index = listVehiculo
                ?.indexWhere((element) => element?.id == vehiculo!.id) ??
            -1;
        final updatedVehiculo = (vehiculo ?? Vehiculo()).copyWith(
            categoriaId: category.id, nombreCategoria: category.nombre);

        await vehiculoStorage.save(updatedVehiculo);

        if (index >= 0) {
          listVehiculo![index] = updatedVehiculo;
        } else {
          listVehiculo?.add(updatedVehiculo);
        }
        await vehiculoListStorage.saveList(listVehiculo!);
      }

      await loadVehiculo();
      widget.onCategoriaSelected(category.id);
    } catch (e) {
      debugPrint('Error en _handleCategoriaTap: $e');
    } finally {}
  }
}
