import '../domain.dart';

class Dispositivos {
  final int? id;
  final String tokenNotificacion;
  final String uniqueDeviceId;
  final String modelo;
  final DateTime? fechaRegistro;
  final DateTime? ultimaConexion;
  final bool? activo;
  final int userId;
  final User user;

  Dispositivos({
    this.id,
    this.tokenNotificacion = "",
    this.uniqueDeviceId = "",
    this.modelo = "",
    this.fechaRegistro,
    this.ultimaConexion,
    this.activo = false,
    this.userId = 0,
    User? user,
  }) : user = user ?? User();

  Dispositivos copyWith({
    int? id,
    String? tokenNotificacion,
    String? uniqueDeviceId,
    String? modelo,
    DateTime? fechaRegistro,
    DateTime? ultimaConexion,
    bool? activo,
    int? userId,
    User? user,
  }) {
    return Dispositivos(
      id: id ?? this.id,
      tokenNotificacion: tokenNotificacion ?? this.tokenNotificacion,
      uniqueDeviceId: uniqueDeviceId ?? this.uniqueDeviceId,
      modelo: modelo ?? this.modelo,
      fechaRegistro: fechaRegistro ?? this.fechaRegistro,
      ultimaConexion: ultimaConexion ?? this.ultimaConexion,
      activo: activo ?? this.activo,
      userId: userId ?? this.userId,
      user: user ?? this.user,
    );
  }

  factory Dispositivos.fromJson(Map<String, dynamic> json) {
    return Dispositivos(
      id: json['id'],
      tokenNotificacion: json['tokenNotificacion'] ?? "",
      uniqueDeviceId: json['uniqueDeviceId'] ?? "",
      modelo: json['modelo'] ?? "",
      fechaRegistro: json['fechaRegistro'] != null
          ? DateTime.parse(json['fechaRegistro'])
          : null,
      ultimaConexion: json['ultimaConexion'] != null
          ? DateTime.parse(json['ultimaConexion'])
          : null,
      activo: json['activo'] ?? false,
      userId: json['userId'] ?? 0,
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tokenNotificacion': tokenNotificacion,
      'uniqueDeviceId': uniqueDeviceId,
      'modelo': modelo,
      'fechaRegistro': fechaRegistro?.toIso8601String(),
      'ultimaConexion': ultimaConexion?.toIso8601String(),
      'activo': activo,
      'userId': userId,
      'user': user.toJson(),
    };
  }
}
