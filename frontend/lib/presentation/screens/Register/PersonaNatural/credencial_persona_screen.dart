import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/domain.dart';
import '../../../../utils/storage/storagex.dart';
import '../../../providers/providers.dart';

class CredencialPersonaScreen extends ConsumerStatefulWidget {
  const CredencialPersonaScreen({super.key});

  @override
  ConsumerState<CredencialPersonaScreen> createState() =>
      _CredencialPersonaScreenState();
}

class _CredencialPersonaScreenState
    extends ConsumerState<CredencialPersonaScreen> {
  User? user;
  Dispositivos? dispositivos;
  PersonaNatural? personaNatural;
  PersonaNaturalStorage personaNaturalStorage = PersonaNaturalStorage();
  UserStorage userStorage = UserStorage();
  DispositivoStorage dispositivoStorage = DispositivoStorage();

  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  Future<void> createUserPersona() async {
    // Muestra el indicador de carga
    showDialog(
      context: context,
      barrierDismissible: false, // Evita que se cierre al tocar fuera
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(), // Indicador de carga
        );
      },
    );

    try {
      user = await userStorage.get();

      if (user!.id == 0) {
        dispositivos = await dispositivoStorage.get();

        final newDispositivo = Dispositivos(
            id: null,
            tokenNotificacion: dispositivos!.tokenNotificacion,
            modelo: dispositivos!.modelo,
            fechaRegistro: DateTime.now(),
            uniqueDeviceId: dispositivos!.uniqueDeviceId,
            ultimaConexion: DateTime.now(),
            activo: true,
            user: user,
            userId: user!.id);

        final dispositivosRepository = ref.watch(dispositivoRepositoryProvider);

        // Creación del dispositivo
        Dispositivos? dispositivo =
            await dispositivosRepository.addDispositivo(newDispositivo);

        User? newUser = dispositivo.user;

        await userStorage.save(newUser);

        // Cierra el indicador de carga
        // ignore: use_build_context_synchronously
        if (context.mounted) Navigator.pop(context);

        if (user!.tipoUserId == 2) {
          // ignore: use_build_context_synchronously
          context.pushReplacement('/listOfertas');
        }

        if (user!.tipoUserId == 3) {
          // ignore: use_build_context_synchronously
          context.pushReplacement('/listServicios');
        }

        // Muestra un mensaje de éxito
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario creado correctamente'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        final personaNaturalRepository =
            ref.watch(personaNaturalRepositoryProvider);

        PersonaNatural? personaNatural = await personaNaturalRepository
            .crearPersonaNatural(user!.personaNatural);

        User? userNew = user!.copyWith(personaNatural: personaNatural);

        await userStorage.save(userNew);
      }
    } catch (e) {
      // Cierra el indicador de carga si hay un error
      // ignore: use_build_context_synchronously
      if (context.mounted) Navigator.pop(context);

      // Muestra un mensaje de error
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _onAccept() async {
    final usuario = _usuarioController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (usuario.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, complete todos los campos.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Los passwords no coinciden.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    User updateUser = user!.copyWith(
        userName: usuario,
        password: BCrypt.hashpw(confirmPassword, BCrypt.gensalt()));

    await userStorage.save(updateUser);
    // ignore: use_build_context_synchronously
    createUserPersona();
  }

  Future<void> cargarDatos() async {
    User? loadedUser = await userStorage.get();
    if (mounted) {
      setState(() {
        user = loadedUser;
        if (user != null) {
          _usuarioController.text = user!.userName;
          _passwordController.text = '';
          _confirmPasswordController.text = '';
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Inicializa el provider para cargar los tipos de identificación
    cargarDatos();
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool obscureText = false,
    bool isPasswordField = false,
    VoidCallback? toggleVisibility,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          suffixIcon: isPasswordField
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: toggleVisibility,
                )
              : null,
        ),
      ),
    );
  }

  void navigateBack() {
    context.pushReplacement('/datospersonanatural');
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (_) => navigateBack(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Credenciales',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTextField('Usuario', _usuarioController),
                      _buildTextField(
                        'Password',
                        _passwordController,
                        obscureText: _obscurePassword,
                        isPasswordField: true,
                        toggleVisibility: _togglePasswordVisibility,
                      ),
                      _buildTextField(
                        'Repetir Password',
                        _confirmPasswordController,
                        obscureText: _obscureConfirmPassword,
                        isPasswordField: true,
                        toggleVisibility: _toggleConfirmPasswordVisibility,
                      ),
                      const SizedBox(height: 20.0),
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
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
