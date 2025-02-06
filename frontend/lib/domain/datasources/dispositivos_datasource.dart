import '../domain.dart';

abstract class DispositivosDataSource {
  Future<Dispositivos> addDispositivo(Dispositivos dispositivos);
  Future<Dispositivos> getDispositivo(String token);
  Future<Dispositivos> getDispositivoByDeviceId(String deviceId);
}
