import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/utils/storage/storagex.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/domain.dart';
import '../../providers/providers.dart';

class ClientDrawer extends ConsumerStatefulWidget {
  final Function(Widget, String) onSelect;

  const ClientDrawer({super.key, required this.onSelect});

  @override
  ConsumerState<ClientDrawer> createState() => _ClientDrawerState();
}

class _ClientDrawerState extends ConsumerState<ClientDrawer> {
  User? user;
  UserStorage? userStorage = UserStorage();
  Future<void> _logout() async {
    user = await userStorage!.get();
    User userupdate = user!.copyWith(estadoUsuarioId: 3);

    final userRepository = ref.watch(
        userRepositoryProvider); // Reemplaza 1 con el ID del usuario actual

    await userRepository.editEstadoUser(userupdate);
    // ignore: use_build_context_synchronously
    context.pushReplacement('/selecttypeuser');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Nombre Cliente'),
            accountEmail: Text('cliente@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: Text(
              'Ofertas',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.list),
            title: Text('Lista de Servicios'),
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
