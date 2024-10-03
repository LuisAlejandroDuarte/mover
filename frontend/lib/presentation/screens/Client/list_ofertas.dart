import 'package:flutter/material.dart';
import 'package:frontend/domain/domain.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/storage/storagex.dart';

class ListOfertas extends StatelessWidget {
  const ListOfertas({super.key});

  void deleteDataStorageOferta() {
    UbicacionOrigenStorage ubicacionOrigenStorage = UbicacionOrigenStorage();
    ubicacionOrigenStorage.delete();

    UbicacionDestinoStorage ubicacionDestinoStorage = UbicacionDestinoStorage();
    ubicacionDestinoStorage.delete();
  }

  @override
  Widget build(BuildContext context) {
    OfertaStorage ofertaStorage = OfertaStorage();
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
              //deleteDataStorageOferta();
              await ofertaStorage.delete();
              await ofertaStorage.save(Oferta());

              // ignore: use_build_context_synchronously
              context.push('/zonatransporter');
            },
            label: Text(
              'Crear oferta',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            icon: const Icon(Icons.add), // Icono al lado del texto
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
