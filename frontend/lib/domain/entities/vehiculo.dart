class Vehiculo {
  final int? id;
  final String placa;
  final String observacion;
  final int? ofertaId;
  final int? carroceriaId;
  final int? modeloId;
  final int? referenciaId;
  final int? estadoVehiculoId;
  final int? condicionVehiculoId;
  final int? claseId;
  final int? categoriaId;
  final int? marcaId;

  Vehiculo({
    this.id,
    this.placa = '',
    this.observacion = '',
    this.ofertaId,
    this.carroceriaId,
    this.modeloId,
    this.referenciaId,
    this.estadoVehiculoId,
    this.condicionVehiculoId,
    this.claseId,
    this.categoriaId,
    this.marcaId,
  });

  factory Vehiculo.fromJson(Map<String, dynamic> json) {
    return Vehiculo(
      id: json['id'],
      placa: json['placa'] ?? '',
      observacion: json['observacion'] ?? '',
      ofertaId: json['ofertaId'],
      carroceriaId: json['carroceriaId'],
      modeloId: json['modeloId'],
      referenciaId: json['referenciaId'],
      estadoVehiculoId: json['estadoVehiculoId'],
      condicionVehiculoId: json['condicionVehiculoId'],
      claseId: json['claseId'],
      categoriaId: json['categoriaId'],
      marcaId: json['marcaId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'placa': placa,
      'observacion': observacion,
      'ofertaId': ofertaId,
      'carroceriaId': carroceriaId,
      'modeloId': modeloId,
      'referenciaId': referenciaId,
      'estadoVehiculoId': estadoVehiculoId,
      'condicionVehiculoId': condicionVehiculoId,
      'claseId': claseId,
      'categoriaId': categoriaId,
      'marcaId': marcaId,
    };
  }

  @override
  String toString() {
    return 'Vehiculo(id: $id, placa: $placa, observacion: $observacion, ofertaId: $ofertaId, carroceriaId: $carroceriaId, modeloId: $modeloId, referenciaId: $referenciaId, estadoVehiculoId: $estadoVehiculoId, condicionVehiculoId: $condicionVehiculoId, claseId: $claseId, categoriaId: $categoriaId, marcaId: $marcaId)';
  }
}
