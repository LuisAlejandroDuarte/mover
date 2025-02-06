import '../domain.dart';

abstract class DispositivosRepositories {
  Future<Dispositivos> addDispositivo(Dispositivos dispositivos);
  Future<Dispositivos> getDispositivo(String token);
  Future<Dispositivos> getDispositivoByDeviceId(String deviceId);
}
