import 'package:flutter/material.dart';
import '../../../utils/storage/storagex.dart';

class DataOrigen extends StatefulWidget {
  const DataOrigen({super.key});

  @override
  DataOrigenState createState() => DataOrigenState();
}

class DataOrigenState extends State<DataOrigen> {
  UbicacionDestinoStorage ubicacionOrigenStorage = UbicacionDestinoStorage();

  // Controladores para los campos de texto
  final TextEditingController nombreCiudadController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController departamentoController = TextEditingController();

  @override
  void dispose() {
    // Limpia los controladores cuando el widget es destruido
    nombreCiudadController.dispose();
    direccionController.dispose();
    departamentoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos de origen'),
      ),
      body: FutureBuilder(
        future: ubicacionOrigenStorage
            .get(), // Supongamos que este método devuelve un Future con la ubicación
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Mientras se espera el resultado, mostrar un indicador de carga
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Si hay un error, mostrar un mensaje de error
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Si se obtienen datos, actualizamos los controladores
            final ubicacion = snapshot.data;
            nombreCiudadController.text = ubicacion!.nombreCiudad!;
            direccionController.text = ubicacion.direccion!;
            departamentoController.text = ubicacion.nombreDepartamento!;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nombreCiudadController,
                    decoration: const InputDecoration(labelText: 'Ciudad'),
                    enabled:
                        false, // Deshabilitado porque no queremos que se edite
                  ),
                  TextField(
                    controller: direccionController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(labelText: 'Dirección'),
                  ),
                  TextField(
                    controller: departamentoController,
                    decoration:
                        const InputDecoration(labelText: 'Departamento'),
                    enabled:
                        false, // Deshabilitado si no se quiere que se edite
                  ),
                ],
              ),
            );
          } else {
            // En caso de que no haya datos, mostrar un mensaje
            return const Center(child: Text('No hay datos disponibles'));
          }
        },
      ),
    );
  }
}
