import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class PlacaScreen extends StatelessWidget {
  const PlacaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Definir controlador para el campo de texto
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingrese su Placa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextField para ingresar la placa
            TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              inputFormatters: [
                LengthLimitingTextInputFormatter(7), // Limita a 7 caracteres
                FilteringTextInputFormatter.allow(RegExp(
                    r'[a-zA-Z0-9\-]')), // Permite letras (mayúsculas/minúsculas), números y guiones
                UpperCaseTextFormatter(), // Convierte el texto a mayúsculas
                PlacaInputFormatter(), // Aplicar el formato personalizado
              ],
              style: const TextStyle(
                fontSize: 32.0, // Tamaño grande de la fuente
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                labelText: 'Número de Placa',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
                height: 40.0), // Espacio entre el TextField y los botones
            // Botones Aceptar y Cancelar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Botón Aceptar
                ElevatedButton(
                  onPressed: () {
                    final placa = controller.text;
                    // Validación de la placa
                    if (placa.length == 7 &&
                        RegExp(r'^[A-Z]{3}-\d{3}$').hasMatch(placa)) {
                      context.push('/condicionvehiculo');
                    } else {
                      print('Placa inválida');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.3, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  child: const Text(
                    'Aceptar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Formatter personalizado para aplicar el guion automáticamente
class PlacaInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remover todos los caracteres no alfanuméricos para facilitar el procesamiento
    String newText = newValue.text.replaceAll(RegExp(r'[^A-Za-z0-9]'), '');

    // Si el texto es mayor de 3 caracteres, agregar el guion
    if (newText.length > 3) {
      newText =
          '${newText.substring(0, 3).toUpperCase()}-${newText.substring(3)}';
    }

    // Retornar el nuevo valor formateado
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

// Formatter para convertir cualquier entrada en mayúsculas
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Convertir todo el texto a mayúsculas
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
