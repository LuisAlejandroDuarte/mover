import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../domain/domain.dart';
import '../../../utils/error_handler.dart';
import '../../../utils/storage/storagex.dart';
import '../../providers/dispositivos/dispositivo_provider.dart';
import '../screen.dart';

Future<Dispositivos?> validarTokenExistToken(BuildContext context) async {
  UserStorage userStorage = UserStorage();
  final infoDispositivo = DispositivoStorage();
  await infoDispositivo.saveDataDispositivo();
  final container = ProviderContainer();
  final dispositivoNotifier = container.read(dispositivoProvider.notifier);
  final kDispositivo = await infoDispositivo.get();

  try {
    await userStorage.delete();
    User user = User();
    await userStorage.save(user);
    final dispositivo = await dispositivoNotifier
        .getDispositivoByDeviceId(kDispositivo!.uniqueDeviceId);
    await userStorage.save(dispositivo.user);
    return dispositivo;
  } catch (e) {
    // Manejo del error de forma segura
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ErrorHandler.handleError(e, context);
    });
    return null;
  }
}

Future<bool> validarExistModel(String modelo) async {
  final infoDispositivo = DispositivoStorage();
  final kDispositivo = await infoDispositivo.get();

  return kDispositivo != null && kDispositivo.modelo == modelo;
}

Future<void> saveStorageDispositivo(Dispositivos dispositivos) async {
  // dispositivos?.copyWith()

  DispositivoStorage dispositivoStorage = DispositivoStorage();
  await dispositivoStorage.save(dispositivos);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Dispositivos?>(
      future: validarTokenExistToken(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SpinKitFadingCircle(
              color: Colors.blueAccent,
              size: 50.0,
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('Error occurred');
        } else if (snapshot.data!.userId == -1 ||
            snapshot.data!.uniqueDeviceId.isEmpty) {
          return const SelectTypeUserScreen();
        } else {
          return FutureBuilder<bool>(
              future: validarExistModel(snapshot.data!.modelo),
              builder: (context, modelSnapshot) {
                saveStorageDispositivo(snapshot.data!);
                if (modelSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitFadingCircle(
                      color: Colors.blueAccent,
                      size: 50.0,
                    ),
                  );
                } else if (modelSnapshot.hasError || !modelSnapshot.data!) {
                  // Si hay un error o los modelos no coinciden, redirige a RegisterScreen
                  return const SelectTypeUserScreen();
                } else if (snapshot.data!.user.estadoUsuarioId == 3) {
                  // Si los modelos coinciden, redirige a PasswordScreen

                  return const SelectTypeUserScreen();
                } else {
                  return const PasswordScreen();
                }
              });
        }
      },
    );
  }
}
