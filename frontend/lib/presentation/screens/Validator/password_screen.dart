import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/entities/user.dart';
import 'package:go_router/go_router.dart';
import 'package:bcrypt/bcrypt.dart';

import '../../providers/providers.dart';
import '../../Widget/widgets.dart';

class PasswordScreen extends StatefulWidget {
  final int userId;

  const PasswordScreen({super.key, required this.userId});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isNavigating = false;

  Future<User> getUserById(int id) async {
    final container = ProviderContainer();
    final userNotifier = container.read(userProvider(id).notifier);
    return await userNotifier.getById(id);
  }

  void _validateAndNavigate(User user) {
    String password = _passwordController.text;
    bool isValid = BCrypt.checkpw(password, user.password);

    if (!isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Contraseña invalida'),
        ),
      );
    } else {
      if (!_isNavigating) {
        setState(() {
          _isNavigating = true;
        });
        context.push('/selecttypeuser');
      }
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digita la contraseña'),
      ),
      body: FutureBuilder<User>(
        future: getUserById(widget.userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading(); // Pantalla de carga mientras el Future se resuelve
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los datos.'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No se encontró el usuario.'));
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.nombre),
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        hintText: 'Digita tu contraseña',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _isNavigating
                          ? null
                          : () => _validateAndNavigate(snapshot.data!),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                          vertical: 12.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Text('Aceptar'),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
