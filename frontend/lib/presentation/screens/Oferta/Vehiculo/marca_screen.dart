import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/domain.dart';
import 'package:go_router/go_router.dart';
import '../../../../utils/storage/storagex.dart';
import '../../../providers/providers.dart';

class MarcaScreen extends ConsumerStatefulWidget {
  final Function(int? index) onMarcaSelected;
  const MarcaScreen({super.key, required this.onMarcaSelected});

  @override
  MarcaScreenState createState() => MarcaScreenState();
}

class MarcaScreenState extends ConsumerState<MarcaScreen> {
  String? selectedMarca;
  TextEditingController searchController = TextEditingController();
  String searchText = "";
  VehiculoStorage vehiculoStorage = VehiculoStorage();
  Vehiculo? vehiculo;
  VehiculoListStorage vehiculoListStorage = VehiculoListStorage();
  List<Vehiculo?>? listVehiculo;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        searchText = searchController.text;
      });
    });
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    vehiculo = await vehiculoStorage.get();
    if (mounted && vehiculo?.claseId != null) {
      ref.read(marcaProvider.notifier).getmarcaByIdClase(vehiculo!.claseId!);
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> _handleMarcaTap(Marca marca) async {
    vehiculo = await vehiculoStorage.get();
    listVehiculo = await vehiculoListStorage.getList();

    int index =
        listVehiculo?.indexWhere((element) => element?.id == vehiculo?.id) ??
            -1;

    Vehiculo updatedVehiculo = vehiculo?.copyWith(
          marcaId: marca.id,
          nombreMarca: marca.nombre,
        ) ??
        Vehiculo(
          marcaId: marca.id,
          nombreMarca: marca.nombre,
        );

    await vehiculoStorage.save(updatedVehiculo);

    if (index >= 0) {
      listVehiculo![index] = updatedVehiculo;
      await vehiculoListStorage.saveList(listVehiculo!);
    }

    setState(() {
      selectedMarca = marca.nombre;
    });
    widget.onMarcaSelected(marca.id);
  }

  @override
  Widget build(BuildContext context) {
    final marcaList = ref.watch(marcaProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: 'Buscar marca...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Color.fromARGB(179, 26, 19, 19)),
          ),
          style: const TextStyle(
              color: Color.fromARGB(255, 39, 30, 30), fontSize: 18.0),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            context.pushReplacement('/mainoferta', extra: {'initialIndex': 1});
          },
        ),
      ),
      body: marcaList.when(
        data: (list) {
          final filteredMarcaList = list
              .where((marca) =>
                  marca.nombre.toLowerCase().contains(searchText.toLowerCase()))
              .toList();

          if (vehiculo != null) {
            final selectedIndex = filteredMarcaList.indexWhere(
              (marca) => marca.id == vehiculo!.marcaId,
            );

            if (selectedIndex != -1) {
              final selectedItem = filteredMarcaList.removeAt(selectedIndex);
              filteredMarcaList.insert(0, selectedItem); // Mover al inicio
            }
          }

          return filteredMarcaList.isEmpty
              ? const Center(child: Text('No se encontraron resultados'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  shrinkWrap:
                      true, // Ajustar el tamaño de la lista a su contenido
                  itemCount: filteredMarcaList.length,
                  itemBuilder: (context, index) {
                    bool isSelected = vehiculo != null &&
                        filteredMarcaList[index].id == vehiculo!.marcaId;

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
                            filteredMarcaList[index].nombre,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ),
                        onTap: () => _handleMarcaTap(filteredMarcaList[index]),
                      ),
                    );
                  },
                );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => const Center(
          child: Text('Error al cargar marcas'),
        ),
      ),
    );
  }
}
