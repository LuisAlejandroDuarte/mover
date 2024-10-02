class Marca {
  final int? id;
  final String nombre;
  final String descripcion;

  Marca({this.id, required this.nombre, this.descripcion = ''});

  factory Marca.fromJson(Map<String, dynamic> json) {
    return Marca(
        id: json['id'],
        nombre: json['nombre'],
        descripcion: json['descripcion']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nombre': nombre, 'descripcion': descripcion};
  }
}
