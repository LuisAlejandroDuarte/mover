import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/entities/vehiculo.dart';
import '../../../utils/storage/storagex.dart';
import '../../providers/providers.dart';

class MarcaScreen extends ConsumerStatefulWidget {
  final int claseId;

  const MarcaScreen({super.key, required this.claseId});

  @override
  MarcaScreenState createState() => MarcaScreenState();
}

class MarcaScreenState extends ConsumerState<MarcaScreen> {
  String? selectedMarca;
  TextEditingController searchController = TextEditingController();
  String searchText = "";
  VehiculoStorage vehiculoStorage = VehiculoStorage();
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(marcaProvider.notifier).getmarcaByIdClase(widget.claseId);
    });

    searchController.addListener(() {
      setState(() {
        searchText = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> _handleMarcaTap(int? marcaId) async {
    Vehiculo? vehiculo = await vehiculoStorage.get();
    if (vehiculo != null) {
      await vehiculoStorage.save(Vehiculo(
          categoriaId: vehiculo.categoriaId,
          carroceriaId: vehiculo.carroceriaId,
          claseId: vehiculo.claseId,
          condicionVehiculoId: vehiculo.condicionVehiculoId,
          estadoVehiculoId: vehiculo.estadoVehiculoId,
          id: vehiculo.id,
          marcaId: marcaId,
          modeloId: vehiculo.modeloId,
          observacion: vehiculo.observacion,
          ofertaId: vehiculo.ofertaId,
          placa: vehiculo.placa,
          referenciaId: vehiculo.referenciaId));
    } else {
      await vehiculoStorage.save(Vehiculo(marcaId: marcaId));
    }

    // Ignora el contexto sincrónico
    if (context.mounted) {
      // ignore: use_build_context_synchronously
      context.push('/referencia/$marcaId');
    }
  }

  @override
  Widget build(BuildContext context) {
    final marcaList = ref.watch(marcaProvider);

    // Filtrar la lista de marcas basándonos en el texto de búsqueda
    final filteredMarcaList = marcaList
        .where((marca) =>
            marca.nombre.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

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
      ),
      body: filteredMarcaList.isEmpty
          ? const Center(
              child:
                  CircularProgressIndicator(), // Mostrar un indicador mientras carga
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true, // Ajustar el tamaño de la lista a su contenido
              itemCount: filteredMarcaList.length,
              itemBuilder: (context, index) {
                final isSelected =
                    filteredMarcaList[index].nombre == selectedMarca;

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
                        filteredMarcaList[index].nombre,
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
                        selectedMarca = filteredMarcaList[index].nombre;
                        _handleMarcaTap(filteredMarcaList[index].id);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
