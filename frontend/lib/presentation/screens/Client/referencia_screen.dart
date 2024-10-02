import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/utils/storage/storagex.dart';
import 'package:go_router/go_router.dart';
import '../../providers/providers.dart';

class ReferenciaScreen extends ConsumerStatefulWidget {
  final int marcaId;

  const ReferenciaScreen({super.key, required this.marcaId});

  @override
  ReferenciaScreenState createState() => ReferenciaScreenState();
}

class ReferenciaScreenState extends ConsumerState<ReferenciaScreen> {
  String? selectedReferencia;
  VehiculoStorage vehiculoStorage = VehiculoStorage();
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(referenciaProvider.notifier)
          .getReferenciaByIdClase(widget.marcaId);
    });
  }

  Future<void> printVehiculos() async {
    var vehiculo = await vehiculoStorage.get();
    print(vehiculo);
  }

  @override
  Widget build(BuildContext context) {
    final referenciaList = ref.watch(referenciaProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccione referencia',
          style: Theme.of(context).textTheme.labelSmall,
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
                final isSelected =
                    referenciaList[index].nombre == selectedReferencia;

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
                        printVehiculos();
                        context.push('/modelo');
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
