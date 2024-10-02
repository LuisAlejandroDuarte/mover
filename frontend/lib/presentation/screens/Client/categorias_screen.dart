import 'package:flutter/material.dart';
import 'package:frontend/domain/entities/vehiculo.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/storage/storagex.dart';
import '../../providers/categoria/categoria_provider.dart';

class CategoriasScreen extends ConsumerStatefulWidget {
  const CategoriasScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CategoriasScreenState createState() => _CategoriasScreenState();
}

class _CategoriasScreenState extends ConsumerState<CategoriasScreen> {
  String? selectedCategoria;
  VehiculoStorage vehiculoStorage = VehiculoStorage();

  Future<void> _handleCategoriaTap(int? categoryId) async {
    await vehiculoStorage.delete();
    await vehiculoStorage.save(Vehiculo(categoriaId: categoryId));

    // Ignora el contexto sincrónico
    if (context.mounted) {
      // ignore: use_build_context_synchronously
      context.push('/clases/$categoryId');
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoriasAsyncValue = ref.watch(categoriaProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccione categoría',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
      body: categoriasAsyncValue.when(
        data: (categorias) {
          return Center(
            // Centrar la lista
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true, // Ajustar el tamaño de la lista a su contenido
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                final isSelected =
                    categorias[index].nombre == selectedCategoria;

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
                        categorias[index].nombre,
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
                        selectedCategoria = categorias[index].nombre;
                        final categoryId = categorias[index].id;
                        _handleCategoriaTap(categoryId);
                      });
                    },
                  ),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
