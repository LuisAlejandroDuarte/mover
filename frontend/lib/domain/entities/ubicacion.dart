class Ubicacion {
  final int? id;
  final String? nombreCiudad;
  final String? latitud;
  final String? longitud;
  final int? precision;
  final DateTime? fechaHora;
  final String? direccion;
  final int? dispositivoId;

  Ubicacion({
    this.id,
    this.nombreCiudad,
    this.latitud,
    this.longitud,
    this.precision,
    this.fechaHora,
    this.direccion,
    this.dispositivoId,
  });

  // Método para crear una instancia desde un JSON
  factory Ubicacion.fromJson(Map<String, dynamic> json) {
    return Ubicacion(
      id: json['Id'],
      nombreCiudad: json['NombreCiudad'],
      latitud: json['Latitud'],
      longitud: json['Longitud'],
      precision: json['Precision'],
      fechaHora:
          json['FechaHora'] != null ? DateTime.parse(json['FechaHora']) : null,
      direccion: json['Direccion'],
      dispositivoId: json['DispositivoId'],
    );
  }

  // Método para convertir la instancia a JSON
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'NombreCiudad': nombreCiudad,
      'Latitud': latitud,
      'Longitud': longitud,
      'Precision': precision,
      'FechaHora': fechaHora?.toIso8601String(),
      'Direccion': direccion,
      'DispositivoId': dispositivoId,
    };
  }
}
