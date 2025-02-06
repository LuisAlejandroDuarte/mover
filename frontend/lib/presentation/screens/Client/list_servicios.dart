import 'package:flutter/material.dart';

class ListServicios extends StatelessWidget {
  const ListServicios({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            'Lista de Servicios',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Positioned(
            bottom: 32.0,
            right: 32.0,
            child: FloatingActionButton.extended(
              onPressed: () async {
                // int idOferta = vehiculos.isEmpty ? -1 : (vehiculos.length * -1) - 1;
                // deleteDataStorageOferta();
              },
              label: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Crear servicio',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              icon: const Icon(Icons.add), // Icono al lado del texto
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              // Ajusta el tamaño del botón si es necesario
              // You can adjust the constraints to modify the padding
              // constraints: BoxConstraints(minWidth: 150.0, minHeight: 50.0),
            )),
      ],
    );
  }
}
