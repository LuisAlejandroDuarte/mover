import '../../domain/domain.dart';

class ZonaTransporterRepositorieImpl extends ZonaTransporterRepositorie {
  final ZonaTransporterDatasource zonaTransporterDatasource;

  ZonaTransporterRepositorieImpl({required this.zonaTransporterDatasource});

  @override
  Future<List<ZonaTransporter>> getAllZonaTransporter() async {
    return await zonaTransporterDatasource.getAllZonaTransporter();
  }
}
