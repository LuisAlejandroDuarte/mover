import '../domain.dart';

abstract class ZonaTransporterDatasource {
  Future<List<ZonaTransporter>> getAllZonaTransporter();
}
