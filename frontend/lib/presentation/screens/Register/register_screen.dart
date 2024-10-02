import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/presentation/bloc/forms/register/register_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/domain.dart';
import '../../../utils/storage/dispositivo_storage.dart';
import '../../../utils/error_handler.dart';
import '../../../utils/storage/token_storage.dart';
import '../../providers/providers.dart';
import '../../Widget/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Nuevo usuario"),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(child: RegisterForm()),
    );
  }
}

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    ref
        .read(listTipoIdentificacionProvider.notifier)
        .fetchTiposIdentificacion(); // Inicializa lo que necesites aquí
  }

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final identificacion = registerCubit.state.identificacion;
    final nombres = registerCubit.state.nombres;
    final apellidos = registerCubit.state.apellidos;
    final direccion = registerCubit.state.direccion;
    final telefono = registerCubit.state.telefono;
    final username = registerCubit.state.userName;
    final password = registerCubit.state.password;
    final repassword = registerCubit.state.repassword;
    final email = registerCubit.state.email;
    bool isLoading = false;
    final tiposIdentificacion = ref.watch(listTipoIdentificacionProvider);

    if (tiposIdentificacion.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    // Inicializa el estado solo si no está inicializado
    if (!_isInitialized &&
        registerCubit.state.tipoIdentificacion.value == null) {
      registerCubit.tipoIdentificacionChanged(tiposIdentificacion.first.id);
      _isInitialized = true;
    }

    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomDropDownList<TipoIdentificacion>(
            hint: "Seleccione Identificación",
            value: (registerCubit.state.tipoIdentificacion.value != null)
                ? tiposIdentificacion.firstWhere((element) =>
                    element.id == registerCubit.state.tipoIdentificacion.value)
                : tiposIdentificacion.first,
            items: tiposIdentificacion,
            onChanged: (tipo) {
              if (tipo != null) {
                registerCubit.tipoIdentificacionChanged(
                    tipo.id); // Pasar el ID al método
              }
            },
            itemLabel: (tipo) {
              // Asegúrate de que el nombre tenga al menos 5 caracteres
              String firstFiveLetters = tipo.nombre.length >= 5
                  ? '${tipo.nombre.substring(0, 20)} ...'
                  : tipo
                      .nombre; // Usa el nombre completo si tiene menos de 5 caracteres
              return '${tipo.sigla}. $firstFiveLetters'; // Agrega un espacio entre sigla y nombre
            },
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            label: "Identificación",
            onchanged: (value) {
              registerCubit.identificacionChanged(value);
            },
            errorMessage: identificacion.errorMessage,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            label: "Nombres",
            onchanged: registerCubit.nombresChanged,
            errorMessage: nombres.errorMessage,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            label: "Apellidos",
            onchanged: registerCubit.apellidosChanged,
            errorMessage: apellidos.errorMessage,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
              label: "Dirección",
              onchanged: registerCubit.direccionChanged,
              errorMessage: direccion.errorMessage),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
              label: "Correo electrónico",
              errorMessage: email.errorMessage,
              onchanged: registerCubit.emailChanged),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
              label: "Teléfono",
              onchanged: registerCubit.telefonoChanged,
              errorMessage: telefono.errorMessage),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
              label: "Nombre usuario",
              onchanged: registerCubit.userNameChanged,
              errorMessage: username.errorMessage),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
              label: "Contraseña",
              obscureText: true,
              errorMessage: password.errorMessage,
              onchanged: registerCubit.passwordChanged),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
              label: "Repetir Contraseña",
              obscureText: true,
              errorMessage: repassword.errorMessage,
              onchanged: registerCubit.rePasswordChanged),
          const SizedBox(
            height: 30,
          ),
          FilledButton.tonalIcon(
            label: isLoading
                // ignore: dead_code
                ? const Text("Creando usuario...")
                : const Text("Crear usuario"),
            icon: isLoading
                // ignore: dead_code
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.save),
            onPressed: isLoading || !registerCubit.state.isValid
                ? null
                : () async {
                    setState(() {
                      isLoading = true;
                    });

                    final user = User(
                      nombre: nombres.value,
                      apellido: apellidos.value,
                      identificacion: identificacion.value,
                      direccion: direccion.value,
                      telefono: telefono.value,
                      email: email.value,
                      userName: username.value,
                      tipoIdentificacionId:
                          registerCubit.state.tipoIdentificacion.value!,
                      estadoUsuarioId: 1,
                      ultimaSesion: DateTime.now(),
                      password: registerCubit.state.repassword.value,
                    );

                    final userRepository = ref.watch(userRepositoryProvider);
                    final dispositivosRepository =
                        ref.watch(dispositivoRepositoryProvider);

                    try {
                      final newUser = await userRepository.addUser(user);

                      final TokenStorage tokenStorage = TokenStorage();
                      await tokenStorage.deleteToken();
                      await tokenStorage.saveToken(newUser.token);

                      try {
                        DispositivoStorage tokenStorage = DispositivoStorage();
                        final tokenNotification = await tokenStorage.get();
                        final dispositivo = Dispositivos(
                          id: null,
                          tokenNotificacion:
                              tokenNotification!.tokenNotificacion,
                          modelo: tokenNotification.modelo,
                          fechaRegistro: DateTime.now(),
                          uniqueDeviceId: tokenNotification.uniqueDeviceId,
                          ultimaConexion: DateTime.now(),
                          activo: true,
                          userId: newUser.id,
                        );

                        await dispositivosRepository
                            .addDispositivo(dispositivo);
                      } catch (e) {
                        // ignore: use_build_context_synchronously
                        ErrorHandler.handleError(e, context);
                      }
                    } catch (e) {
                      // ignore: use_build_context_synchronously
                      ErrorHandler.handleError(e, context);
                    }

                    setState(() {
                      isLoading = false;
                      context.push('/selecttypeuser');
                    });

                    // registerCubit.onSubmit(); // Si tienes alguna acción adicional al finalizar
                  },
          ),
        ],
      ),
    );
  }
}
