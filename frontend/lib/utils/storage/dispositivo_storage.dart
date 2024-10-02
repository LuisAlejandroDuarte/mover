import 'dart:io';
import 'package:frontend/utils/storage/storage_impl.dart';
import '../../domain/domain.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DispositivoStorage {
  StorageImpl<Dispositivos> storageImpl = StorageImpl<Dispositivos>(
    'dispositivo',
    fromJson: (json) => Dispositivos.fromJson(json),
    toJson: (dispositivo) => dispositivo.toJson(),
  );

  Future<void> saveDataDispositivo() async {
    String? token = ""; // Supongamos que obtienes el token de algún servicio

    String? uniqueDeviceId = "";
    String? modelo = "";

    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      // Obtén la información del dispositivo Android
      final androidInfo = await deviceInfoPlugin.androidInfo;
      modelo = androidInfo.model; // Nombre del modelo del dispositivo
      uniqueDeviceId = androidInfo.id; // ID único del dispositivo
    } else if (Platform.isIOS) {
      // Obtén la información del dispositivo iOS
      final iosInfo = await deviceInfoPlugin.iosInfo;
      modelo = iosInfo.utsname.machine; // Nombre del modelo del dispositivo
      uniqueDeviceId = iosInfo.identifierForVendor; // ID único del dispositivo
    }

    await save(Dispositivos(
      tokenNotificacion: token,
      modelo: modelo,
      uniqueDeviceId: uniqueDeviceId!,
    ));
  }

  Future<void> delete() async {
    return await storageImpl.delete();
  }

  Future<void> save(Dispositivos entity) async {
    return await storageImpl.save(entity);
  }

  Future<Dispositivos?> get() async {
    return await storageImpl.get();
  }
}
