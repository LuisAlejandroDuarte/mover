import '../../domain/domain.dart';

class DispositivoRepositorieImpl extends DispositivosRepositories {
  final DispositivosDataSource dispositivosDataSource;

  DispositivoRepositorieImpl({required this.dispositivosDataSource});

  @override
  Future<int> addDispositivo(Dispositivos dispositivos) async {
    return await dispositivosDataSource.addDispositivo(dispositivos);
  }

  @override
  Future<Dispositivos> getDispositivo(String token) async {
    return await dispositivosDataSource.getDispositivo(token);
  }

  @override
  Future<Dispositivos> getDispositivoByDeviceId(String deviceId) async {
    return await dispositivosDataSource.getDispositivoByDeviceId(deviceId);
  }
}
