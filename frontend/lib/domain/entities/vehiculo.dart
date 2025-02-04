import '../domain.dart';

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
  final List<Map<int, bool>>? parametrosVehiculo;
  final List<MultimediaVehiculo?>? multimediaVehiculo;

  final String? nombreCategoria;
  final String? nombreClase;
  final String? nombreCarroceria;
  final String? nombreMarca;
  final String? nombreReferencia;
  final String? nombreModelo;
  final String? nombrePlaca;
  final String? nombreCondicion;
  final String? nombreEstado;
  final List<String>? nombreParametros;

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
    this.parametrosVehiculo,
    this.multimediaVehiculo,
    this.nombreCategoria,
    this.nombreClase,
    this.nombreCarroceria,
    this.nombreMarca,
    this.nombreReferencia,
    this.nombreModelo,
    this.nombrePlaca,
    this.nombreCondicion,
    this.nombreEstado,
    this.nombreParametros,
  });

  Vehiculo copyWith({
    int? id,
    String? placa,
    String? observacion,
    int? ofertaId,
    int? carroceriaId,
    int? modeloId,
    int? referenciaId,
    int? estadoVehiculoId,
    int? condicionVehiculoId,
    int? claseId,
    int? categoriaId,
    int? marcaId,
    List<Map<int, bool>>? parametrosVehiculo,
    List<MultimediaVehiculo?>? multimediaVehiculo,
    String? nombreCategoria,
    String? nombreClase,
    String? nombreCarroceria,
    String? nombreMarca,
    String? nombreReferencia,
    String? nombreModelo,
    String? nombrePlaca,
    String? nombreCondicion,
    String? nombreEstado,
    List<String>? nombreParametros,
  }) {
    return Vehiculo(
      id: id ?? this.id,
      placa: placa ?? this.placa,
      observacion: observacion ?? this.observacion,
      ofertaId: ofertaId ?? this.ofertaId,
      carroceriaId: carroceriaId ?? this.carroceriaId,
      modeloId: modeloId ?? this.modeloId,
      referenciaId: referenciaId ?? this.referenciaId,
      estadoVehiculoId: estadoVehiculoId ?? this.estadoVehiculoId,
      condicionVehiculoId: condicionVehiculoId ?? this.condicionVehiculoId,
      claseId: claseId ?? this.claseId,
      categoriaId: categoriaId ?? this.categoriaId,
      marcaId: marcaId ?? this.marcaId,
      parametrosVehiculo: parametrosVehiculo ?? this.parametrosVehiculo,
      multimediaVehiculo: multimediaVehiculo ?? this.multimediaVehiculo,
      nombreCategoria: nombreCategoria ?? this.nombreCategoria,
      nombreClase: nombreClase ?? this.nombreClase,
      nombreCarroceria: nombreCarroceria ?? this.nombreCarroceria,
      nombreMarca: nombreMarca ?? this.nombreMarca,
      nombreReferencia: nombreReferencia ?? this.nombreReferencia,
      nombreModelo: nombreModelo ?? this.nombreModelo,
      nombrePlaca: nombrePlaca ?? this.nombrePlaca,
      nombreCondicion: nombreCondicion ?? this.nombreCondicion,
      nombreEstado: nombreEstado ?? this.nombreEstado,
      nombreParametros: nombreParametros ?? this.nombreParametros,
    );
  }

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
      parametrosVehiculo: json['parametrosVehiculo'] != null
          ? List<Map<int, bool>>.from(
              json['parametrosVehiculo'].map((item) =>
                  {int.parse(item['id'].toString()): item['value'] as bool}),
            )
          : null,
      multimediaVehiculo: json['multimediaVehiculo'] != null
          ? List<MultimediaVehiculo>.from(json['multimediaVehiculo']
              .map((item) => MultimediaVehiculo.fromJson(item)))
          : null,
      nombreCategoria: json['nombreCategoria'],
      nombreClase: json['nombreClase'],
      nombreCarroceria: json['nombreCarroceria'],
      nombreMarca: json['nombreMarca'],
      nombreReferencia: json['nombreReferencia'],
      nombreModelo: json['nombreModelo'],
      nombrePlaca: json['nombrePlaca'],
      nombreCondicion: json['nombreCondicion'],
      nombreEstado: json['nombreEstado'],
      nombreParametros: json['nombreParametros'] != null
          ? List<String>.from(json['nombreParametros'])
          : null,
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
      'parametrosVehiculo': parametrosVehiculo
          ?.map((param) => {
                'id': param.keys.first,
                'value': param.values.first,
              })
          .toList(),
      'multimediaVehiculo':
          multimediaVehiculo?.map((item) => item!.toJson()).toList(),
      'nombreCategoria': nombreCategoria,
      'nombreClase': nombreClase,
      'nombreCarroceria': nombreCarroceria,
      'nombreMarca': nombreMarca,
      'nombreReferencia': nombreReferencia,
      'nombreModelo': nombreModelo,
      'nombrePlaca': nombrePlaca,
      'nombreCondicion': nombreCondicion,
      'nombreEstado': nombreEstado,
      'nombreParametros': nombreParametros,
    };
  }

  @override
  String toString() {
    return 'Vehiculo(id: $id, placa: $placa, observacion: $observacion, ofertaId: $ofertaId, carroceriaId: $carroceriaId, modeloId: $modeloId, referenciaId: $referenciaId, estadoVehiculoId: $estadoVehiculoId, condicionVehiculoId: $condicionVehiculoId, claseId: $claseId, categoriaId: $categoriaId, marcaId: $marcaId, parametrosVehiculo: $parametrosVehiculo, multimediaVehiculo: $multimediaVehiculo, nombreCategoria: $nombreCategoria, nombreClase: $nombreClase, nombreCarroceria: $nombreCarroceria, nombreMarca: $nombreMarca, nombreReferencia: $nombreReferencia, nombreModelo: $nombreModelo, nombrePlaca: $nombrePlaca, nombreCondicion: $nombreCondicion, nombreEstado: $nombreEstado, nombreParametros: $nombreParametros)';
  }
}
