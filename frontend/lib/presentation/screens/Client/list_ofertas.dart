import 'package:flutter/material.dart';
import 'package:frontend/domain/domain.dart';
import 'package:frontend/utils/storage/user_storage.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/storage/storagex.dart';

class ListOfertas extends StatelessWidget {
  const ListOfertas({super.key});

  void deleteDataStorageOferta() {
    UbicacionDestinoStorage ubicacionOrigenStorage = UbicacionDestinoStorage();
    ubicacionOrigenStorage.delete();

    UbicacionDestinoStorage ubicacionDestinoStorage = UbicacionDestinoStorage();
    ubicacionDestinoStorage.delete();
  }

  @override
  Widget build(BuildContext context) {
    OfertaStorage ofertaStorage = OfertaStorage();
    UserStorage userStorage = UserStorage();
    User? user;
    VehiculoStorage vehiculoStorage = VehiculoStorage();
    VehiculoListStorage vehiculoListStorage = VehiculoListStorage();
    MultimediaVehiculoListStorage multimediaVehiculoListStorage =
        MultimediaVehiculoListStorage();
    UbicacionDestinoStorage ubicacionDestinoStorage = UbicacionDestinoStorage();
    UbicacionDestinoStorage ubicacionOrigenStorage = UbicacionDestinoStorage();
    Oferta? oferta;
    return Stack(
      children: [
        Center(
          child: Text(
            'Lista de Ofertas',
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
                user = await userStorage.get();
                await ofertaStorage.delete();
                await vehiculoStorage.delete();
                await vehiculoListStorage.delete();
                await multimediaVehiculoListStorage.delete();
                await ubicacionOrigenStorage.delete();
                await ubicacionDestinoStorage.delete();

                oferta = Oferta(userId: user!.id);

                await ofertaStorage.save(oferta!);

                // ignore: use_build_context_synchronously
                context.push('/mainoferta', extra: {'initialIndex': 0});
              },
              label: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Crear oferta',
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
