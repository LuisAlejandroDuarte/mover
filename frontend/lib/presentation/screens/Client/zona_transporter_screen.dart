import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/zonatransporter/zona_transporter_provider.dart';

class ZonaTransporterScreen extends ConsumerStatefulWidget {
  const ZonaTransporterScreen({super.key});

  @override
  ZonaTransporterScreenState createState() => ZonaTransporterScreenState();
}

class ZonaTransporterScreenState extends ConsumerState<ZonaTransporterScreen> {
  String? selectedZonaTransporter;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(zonaTransporterProvider.notifier).fetchZonaTransporters();
    });
  }

  Future<void> handleZonaTransporterTap(int? zonaTransporterId) async {
    context.push('/categorias');
  }

  @override
  Widget build(BuildContext context) {
    final zonaTransporterList = ref.watch(zonaTransporterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccione Zona',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
      body: zonaTransporterList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            ) // Mostrar un indicador mientras carga
          : Center(
              // Envolver el ListView en un Center
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                shrinkWrap:
                    true, // Ajustar el tamaño de la lista a su contenido
                itemCount: zonaTransporterList.length,
                itemBuilder: (context, index) {
                  final isSelected = zonaTransporterList[index].nombre ==
                      selectedZonaTransporter;

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
                          zonaTransporterList[index].nombre,
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
                          final zonaTransporterId =
                              zonaTransporterList[index].id;
                          handleZonaTransporterTap(zonaTransporterId);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
    );
  }
}
