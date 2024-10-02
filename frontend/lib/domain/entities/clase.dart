class Clases {
  final int? id;
  final String nombre;
  final String descripcion;
  final int categoriaId;

  Clases(
      {this.id,
      required this.nombre,
      required this.descripcion,
      required this.categoriaId});

  factory Clases.fromJson(Map<String, dynamic> json) {
    return Clases(
        id: json['id'],
        nombre: json['nombre'],
        descripcion: json['descripcion'],
        categoriaId: json['categoriaId']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'categoriaId': categoriaId
    };
  }
}
