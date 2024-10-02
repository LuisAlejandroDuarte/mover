class Referencia {
  final int? id;
  final String nombre;
  final String? descripcion;
  final int marcaId;

  Referencia(
      {this.id,
      required this.nombre,
      required this.descripcion,
      required this.marcaId});

  factory Referencia.fromJson(Map<String, dynamic> json) {
    return Referencia(
        id: json['id'],
        nombre: json['nombre'],
        descripcion: json['descripcion'],
        marcaId: json['marcaId']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'marcaId': marcaId
    };
  }
}
