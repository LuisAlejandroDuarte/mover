import '../domain.dart';

abstract class ZonaTransporterRepositorie {
  Future<List<ZonaTransporter>> getAllZonaTransporter();
}
