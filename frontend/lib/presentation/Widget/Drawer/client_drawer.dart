import 'package:flutter/material.dart';

class ClientDrawer extends StatelessWidget {
  final Function(Widget, String) onSelect;

  const ClientDrawer({super.key, required this.onSelect});

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
          const ListTile(
            leading: Icon(Icons.add),
            title: Text('Ofertas'),
            // onTap: () {
            //   onSelect(const ListOfertas(), "Ofertas");
            // },
          ),
          const ListTile(
            leading: Icon(Icons.list),
            title: Text('Lista de Servicios'),
            // onTap: () {
            //   onSelect(
            //       const Center(child: Text('Lista de Servicios')), "Servicios");
            // },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar Sesión'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
