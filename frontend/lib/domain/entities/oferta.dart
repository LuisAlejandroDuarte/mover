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

  Oferta(
      {this.id,
      this.nombreRecibe = "",
      this.nombreEntrega = "",
      this.observaciones = "",
      this.precio = 0,
      this.userId,
      this.ubicacionOrigenId,
      this.ubicacionDestinoId,
      this.zonaTransporterId,
      this.estadoOfertaId});

  factory Oferta.fromJson(Map<String, dynamic> json) {
    return Oferta(
        id: json['id'],
        nombreRecibe: json['nombreRecibe'],
        nombreEntrega: json['nombreEntrega'],
        observaciones: json['observaciones'],
        precio: json['precio'],
        userId: json['userId'],
        ubicacionOrigenId: json['ubicacionOrigenId'],
        ubicacionDestinoId: json['ubicacionDestinoId'],
        zonaTransporterId: json['zonaTransporterId'],
        estadoOfertaId: json['estadoOfertaId']);
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
    };
  }
}
