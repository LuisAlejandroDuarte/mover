import 'package:flutter/material.dart';
import 'package:frontend/domain/entities/user.dart';
import 'package:frontend/utils/storage/user_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:bcrypt/bcrypt.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Widget/widgets.dart';
import '../../providers/providers.dart';

class PasswordScreen extends ConsumerStatefulWidget {
  const PasswordScreen({super.key});

  @override
  PasswordScreenState createState() => PasswordScreenState();
}

class PasswordScreenState extends ConsumerState<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  UserStorage userStorage = UserStorage();
  User? user;
  bool _obscureText = true;
  bool _isNavigating = false;

  Future<User> getUserById() async {
    user = await userStorage.get();
    return user!;
  }

  void updateEstado() async {
    user = await userStorage.get();
    if (user != null) {
      User userUpdate = user!.copyWith(estadoUsuarioId: 1);
      final userRepository = ref.watch(userRepositoryProvider);
      await userRepository.editEstadoUser(userUpdate);
    }
  }

  void _validateAndNavigate(User user) async {
    String password = _passwordController.text;
    bool isValid = BCrypt.checkpw(password, user.password);

    if (!isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Contraseña inválida'),
        ),
      );
    } else {
      _passwordController.text = '';
      if (user.tipoUserId == 2) {
        context.push('/listOfertas');
      }
      if (user.tipoUserId == 3) {
        context.push('/listServicios');
      }

      updateEstado();
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
        future: getUserById(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
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
