import 'entities.dart';

class Oferta {
  final int? id;
  final String nombreRecibe;
  final String nombreEntrega;
  final String observaciones;
  final double precio;

  final int? userId;
  final int? ubicacionOrigenId;
  final int? ubicacionDestinoId;
  final int? zonaTransporterId;
  final int? estadoOfertaId;

  final Ubicacion? ubicacionOrigen;
  final Ubicacion? ubicacionDestino;

  Oferta({
    this.id,
    this.nombreRecibe = "",
    this.nombreEntrega = "",
    this.observaciones = "",
    this.precio = 0,
    this.userId,
    this.ubicacionOrigenId,
    this.ubicacionDestinoId,
    this.zonaTransporterId,
    this.estadoOfertaId,
    this.ubicacionOrigen,
    this.ubicacionDestino,
  });

  Oferta copyWith(
      {int? id,
      String? nombreRecibe,
      String? nombreEntrega,
      String? observaciones,
      double? precio,
      int? userId,
      int? ubicacionOrigenId,
      int? ubicacionDestinoId,
      int? zonaTransporterId,
      int? estadoOfertaId,
      Ubicacion? ubicacionOrigen,
      Ubicacion? ubicacionDestino}) {
    return Oferta(
        id: id ?? this.id,
        nombreRecibe: nombreRecibe ?? this.nombreRecibe,
        nombreEntrega: nombreEntrega ?? this.nombreEntrega,
        observaciones: observaciones ?? this.observaciones,
        precio: precio ?? this.precio,
        userId: userId ?? this.userId,
        ubicacionOrigenId: ubicacionOrigenId ?? this.ubicacionOrigenId,
        ubicacionDestinoId: ubicacionDestinoId ?? this.ubicacionDestinoId,
        zonaTransporterId: zonaTransporterId ?? this.zonaTransporterId,
        estadoOfertaId: estadoOfertaId ?? this.estadoOfertaId,
        ubicacionOrigen: ubicacionOrigen ?? this.ubicacionOrigen,
        ubicacionDestino: ubicacionDestino ?? this.ubicacionDestino);
  }

  factory Oferta.fromJson(Map<String, dynamic> json) {
    return Oferta(
      id: json['id'],
      nombreRecibe: json['nombreRecibe'] ?? "",
      nombreEntrega: json['nombreEntrega'] ?? "",
      observaciones: json['observaciones'] ?? "",
      precio: (json['precio'] ?? 0).toDouble(),
      userId: json['userId'],
      ubicacionOrigenId: json['ubicacionOrigenId'],
      ubicacionDestinoId: json['ubicacionDestinoId'],
      zonaTransporterId: json['zonaTransporterId'],
      estadoOfertaId: json['estadoOfertaId'],
      ubicacionOrigen: json['ubicacionOrigen'] != null
          ? Ubicacion.fromJson(json['ubicacionOrigen'])
          : null,
      ubicacionDestino: json['ubicacionDestino'] != null
          ? Ubicacion.fromJson(json['ubicacionDestino'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombreRecibe': nombreRecibe,
      'nombreEntrega': nombreEntrega,
      'observaciones': observaciones,
      'precio': precio,
      'userId': userId,
      'ubicacionOrigenId': ubicacionOrigenId,
      'ubicacionDestinoId': ubicacionDestinoId,
      'zonaTransporterId': zonaTransporterId,
      'estadoOfertaId': estadoOfertaId,
      'ubicacionOrigen': ubicacionOrigen?.toJson(),
      'ubicacionDestino': ubicacionDestino?.toJson(),
    };
  }
}
