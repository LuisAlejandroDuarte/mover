import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/utils/storage/storagex.dart';
import '../../../domain/domain.dart';
import '../../providers/providers.dart';
import 'package:go_router/go_router.dart';

class TransportistaDrawer extends ConsumerStatefulWidget {
  const TransportistaDrawer({super.key});

  @override
  ConsumerState<TransportistaDrawer> createState() =>
      _TransportistaDrawerState();
}

class _TransportistaDrawerState extends ConsumerState<TransportistaDrawer> {
  User? user;
  UserStorage? userStorage = UserStorage();

  String nombre = '';
  String email = '';

  Future<void> cargarDatos() async {
    user = await userStorage!.get();

    setState(() {
      if (user!.tipoNaturaleza == 1) {
        nombre =
            '${user!.personaNatural.nombre} ${user!.personaNatural.apellido}';
        email = user!.personaNatural.email;
      }

      if (user!.tipoNaturaleza == 2) {
        nombre = '${user!.empresa.razonSocial}';
        email = user!.empresa.email;
      }
    });
  }

  Future<void> _logout() async {
    final userStorage = UserStorage();
    User? user = await userStorage.get();

    if (user != null) {
      User userupdate = user.copyWith(estadoUsuarioId: 3);
      final userRepository = ref.read(userRepositoryProvider);
      await userRepository.editEstadoUser(userupdate);
    }

    if (context.mounted) {
      // ignore: use_build_context_synchronously
      context.pushReplacement('/selecttypeuser');
    }
  }

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(nombre),
            accountEmail: Text(email),
            // currentAccountPicture: const CircleAvatar(
            //   backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            // ),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: Text(
              'Conductores',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: Text(
              'Servicios',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar Sesión'),
            onTap: _logout, // Llama al método de cierre de sesión
          ),
        ],
      ),
    );
  }
}
