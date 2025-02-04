import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../domain/entities/vehiculo.dart';
import '../../../../utils/storage/storagex.dart';

class PlacaScreen extends StatefulWidget {
  final Function() onPlacaSelected;
  const PlacaScreen({required this.onPlacaSelected, super.key});

  @override
  PlacaScreenState createState() => PlacaScreenState();
}

class PlacaScreenState extends State<PlacaScreen> {
  final TextEditingController controller = TextEditingController();
  late VehiculoStorage vehiculoStorage;
  Vehiculo? vehiculo;
  VehiculoListStorage vehiculoListStorage = VehiculoListStorage();
  List<Vehiculo?>? listVehiculo;

  @override
  void initState() {
    super.initState();
    vehiculoStorage = VehiculoStorage();
    loadVehiculo();
  }

  Future<void> loadVehiculo() async {
    vehiculo = await vehiculoStorage.get();
    if (vehiculo != null) {
      controller.text = vehiculo!.placa; // Cargar la placa en el controlador
    }
  }

  Future<void> _handleModeloTap(String placa) async {
    listVehiculo = await vehiculoListStorage.getList();

    int index =
        listVehiculo?.indexWhere((element) => element?.id == vehiculo?.id) ??
            -1;

    Vehiculo updatedVehiculo = vehiculo?.copyWith(
          placa: placa,
        ) ??
        Vehiculo(
          placa: placa,
        );

    await vehiculoStorage.save(updatedVehiculo);

    if (index >= 0) {
      listVehiculo![index] = updatedVehiculo;
      await vehiculoListStorage.saveList(listVehiculo!);
    }
    await loadVehiculo();
    widget.onPlacaSelected();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingrese su Placa',
            style: Theme.of(context).textTheme.labelLarge),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            context.pushReplacement('/mainoferta', extra: {'initialIndex': 1});
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              inputFormatters: [
                LengthLimitingTextInputFormatter(7),
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\-]')),
                UpperCaseTextFormatter(),
                PlacaInputFormatter(),
              ],
              style: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                _handleModeloTap(controller.text);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'Aceptar',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlacaInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(RegExp(r'[^A-Za-z0-9]'), '');
    if (newText.length > 3) {
      newText =
          '${newText.substring(0, 3).toUpperCase()}-${newText.substring(3)}';
    }
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
