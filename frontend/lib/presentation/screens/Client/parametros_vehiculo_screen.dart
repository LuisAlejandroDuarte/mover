import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/parametrosvehiculo/parametros_vehiculo_provider.dart';

class ParametrosVehiculoScreen extends ConsumerStatefulWidget {
  const ParametrosVehiculoScreen({super.key});

  @override
  ParametrosVehiculoScreenState createState() =>
      ParametrosVehiculoScreenState();
}

class ParametrosVehiculoScreenState
    extends ConsumerState<ParametrosVehiculoScreen> {
  // Set para almacenar los IDs seleccionados
  Set<int> selectedParametrosVehiculoIds = {};

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(parametrosVehiculoProvider.notifier).fetchParametrosVehiculos();
    });
  }

  Future<void> handleParametrosVehiculoTap() async {
    // Aquí puedes manejar lo que sucederá al presionar el botón de Aceptar
    // Por ejemplo, podrías enviar los IDs seleccionados a otro endpoint o realizar alguna acción.
    if (selectedParametrosVehiculoIds.isNotEmpty) {
      context.push('/addvehiclephoto'); // Navegar a otra pantalla
    } else {
      // Mostrar mensaje de selección vacía
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Debe seleccionar al menos un parámetro.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final parametrosVehiculoList = ref.watch(parametrosVehiculoProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccione Parametros Vehículo',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
      body: parametrosVehiculoList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: parametrosVehiculoList.length,
                    itemBuilder: (context, index) {
                      final parametrosVehiculo = parametrosVehiculoList[index];
                      final isSelected = selectedParametrosVehiculoIds
                          .contains(parametrosVehiculo.id);

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
                        child: CheckboxListTile(
                          title: Text(
                            parametrosVehiculo.nombre,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.black,
                                ),
                          ),
                          value: isSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                selectedParametrosVehiculoIds
                                    .add(parametrosVehiculo.id!);
                              } else {
                                selectedParametrosVehiculoIds
                                    .remove(parametrosVehiculo.id);
                              }
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                      16.0), // Espaciado alrededor del botón
                  child: ElevatedButton(
                    onPressed: handleParametrosVehiculoTap,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 32.0), // Tamaño del botón
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Aceptar',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: const Color.fromARGB(255, 12, 11, 11)),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
