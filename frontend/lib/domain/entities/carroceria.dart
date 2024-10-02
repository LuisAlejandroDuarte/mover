class Carroceria {
  final int? id;
  final String nombre;
  final String? descripcion;
  final int claseId;

  Carroceria(
      {this.id,
      required this.nombre,
      required this.descripcion,
      required this.claseId});

  factory Carroceria.fromJson(Map<String, dynamic> json) {
    return Carroceria(
        id: json['id'],
        nombre: json['nombre'],
        descripcion: json['descripcion'],
        claseId: json['claseId']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'claseId': claseId
    };
  }
}
