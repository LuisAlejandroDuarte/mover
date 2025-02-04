class Equipo {
  final int? id;
  final int? userId;
  final String placasVehiculo;
  final int? marcaId;
  final int? modeloId;
  final int? referenciaId;
  final int? carroceriaId;
  final String color;
  final String placasSemirremolque;
  final String linkLicenciaConduccion;
  final String linkSoat;
  final String linkTecnomecanica;
  final int? estadoEquipoId;

  Equipo({
    this.id,
    this.userId,
    this.placasVehiculo = "",
    this.marcaId,
    this.modeloId,
    this.referenciaId,
    this.carroceriaId,
    this.color = "",
    this.placasSemirremolque = "",
    this.linkLicenciaConduccion = "",
    this.linkSoat = "",
    this.linkTecnomecanica = "",
    this.estadoEquipoId,
  });

  /// Método para crear un objeto `Equipo` desde un JSON.
  factory Equipo.fromJson(Map<String, dynamic> json) {
    return Equipo(
      id: json['id'],
      userId: json['userId'],
      placasVehiculo: json['placasVehiculo'] ?? "",
      marcaId: json['marcaId'],
      modeloId: json['modeloId'],
      referenciaId: json['referenciaId'],
      carroceriaId: json['carroceriaId'],
      color: json['color'] ?? "",
      placasSemirremolque: json['placasSemirremolque'] ?? "",
      linkLicenciaConduccion: json['linkLicenciaConduccion'] ?? "",
      linkSoat: json['linkSoat'] ?? "",
      linkTecnomecanica: json['linkTecnomecanica'] ?? "",
      estadoEquipoId: json['estadoEquipoId'],
    );
  }

  /// Método para convertir un objeto `Equipo` a JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'placasVehiculo': placasVehiculo,
      'marcaId': marcaId,
      'modeloId': modeloId,
      'referenciaId': referenciaId,
      'carroceriaId': carroceriaId,
      'color': color,
      'placasSemirremolque': placasSemirremolque,
      'linkLicenciaConduccion': linkLicenciaConduccion,
      'linkSoat': linkSoat,
      'linkTecnomecanica': linkTecnomecanica,
      'estadoEquipoId': estadoEquipoId,
    };
  }
}
