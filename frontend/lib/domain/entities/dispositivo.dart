class Dispositivos {
  final int? id;
  final String tokenNotificacion;
  final String uniqueDeviceId;
  final String modelo;
  final DateTime? fechaRegistro;
  final DateTime? ultimaConexion;
  final bool? activo;
  final int userId;

  Dispositivos(
      {this.id,
      this.tokenNotificacion = "",
      this.uniqueDeviceId = "",
      this.modelo = "",
      this.fechaRegistro,
      this.ultimaConexion,
      this.activo = false,
      this.userId = 0});

  factory Dispositivos.fromJson(Map<String, dynamic> json) {
    return Dispositivos(
        id: json['id'],
        tokenNotificacion: json['tokenNotificacion'],
        uniqueDeviceId: json['uniqueDeviceId'],
        modelo: json['modelo'],
        fechaRegistro: json['fechaRegistro'] != null
            ? DateTime.parse(json['fechaRegistro'])
            : null,
        ultimaConexion: json['ultimaConexion'] != null
            ? DateTime.parse(json['ultimaConexion'])
            : null,
        activo: json['activo'],
        userId: json['userId']);
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
      'userId': userId
    };
  }
}

class KeyDispositivo {
  final String tokenNotificacion;
  final String modelo;
  final String uniqueDeviceId;
  KeyDispositivo(
      {required this.tokenNotificacion,
      required this.modelo,
      required this.uniqueDeviceId});

  factory KeyDispositivo.fromJson(Map<String, dynamic> json) {
    return KeyDispositivo(
      tokenNotificacion: json['tokenNotificacion'],
      uniqueDeviceId: json['uniqueDeviceId'],
      modelo: json['modelo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tokenNotificacion': tokenNotificacion,
      'modelo': modelo,
      'uniqueDeviceId': uniqueDeviceId
    };
  }
}
