import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthConductorScreen extends StatefulWidget {
  const AuthConductorScreen({super.key});

  @override
  State<AuthConductorScreen> createState() => _AuthConductorScreenState();
}

class _AuthConductorScreenState extends State<AuthConductorScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onAccept() {
    String id = _idController.text.trim();
    String password = _passwordController.text.trim();

    if (id.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, ingrese su identificación y clave.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // TODO: Agregar la lógica de autenticación aquí.

    context.push('/selecttypeconductor');
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (dipPop) async {
        context.pushReplacement('/typeTransportador');
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Conductor Autorizado',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              context.pushReplacement('/typeTransportador');
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _idController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Identificación',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Clave',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: _onAccept,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.6, 50),
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
      ),
    );
  }
}
