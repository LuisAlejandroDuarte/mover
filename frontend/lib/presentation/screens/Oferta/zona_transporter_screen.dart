import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/entities.dart';
import '../../../utils/storage/storagex.dart';
import '../../providers/zonatransporter/zona_transporter_provider.dart';

class ZonaTransporterScreen extends ConsumerStatefulWidget {
  final Function() onZonaTransporterSelected;
  const ZonaTransporterScreen(
      {required this.onZonaTransporterSelected, super.key});

  @override
  ZonaTransporterScreenState createState() => ZonaTransporterScreenState();
}

class ZonaTransporterScreenState extends ConsumerState<ZonaTransporterScreen> {
  String? selectedZonaTransporter;
  OfertaStorage ofertaStorage = OfertaStorage();
  Oferta? oferta = Oferta();

  @override
  void initState() {
    super.initState();
    ref.read(zonaTransporterProvider.notifier).fetchZonaTransporters();
    loadOferta();
  }

  Future<void> handleZonaTransporterTap(int? zonaTransporterId) async {
    oferta = await ofertaStorage.get();

    if (oferta != null) {
      await ofertaStorage.save(oferta!.copyWith(
        zonaTransporterId: zonaTransporterId,
      ));
    }
    widget.onZonaTransporterSelected();
  }

  Future<void> loadOferta() async {
    oferta = await ofertaStorage.get();

    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var zonaTransporterList = ref.watch(zonaTransporterProvider);

    // Reordenar la lista si hay una zona seleccionada
    if (oferta != null) {
      final selectedIndex = zonaTransporterList
          .indexWhere((zona) => zona.id == oferta!.zonaTransporterId);
      if (selectedIndex != -1) {
        final selectedItem = zonaTransporterList.removeAt(selectedIndex);
        zonaTransporterList.insert(0, selectedItem); // Mover al inicio
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Elige un modo de servicio',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: zonaTransporterList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                shrinkWrap: true,
                itemCount: zonaTransporterList.length,
                itemBuilder: (context, index) {
                  bool isSelected = zonaTransporterList[index].id ==
                      oferta?.zonaTransporterId;

                  return Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color:
                            isSelected ? Colors.blue[400]! : Colors.transparent,
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
                          selectedZonaTransporter =
                              zonaTransporterList[index].nombre;
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
