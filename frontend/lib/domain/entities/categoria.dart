class Categorias {
  final int? id;
  final String nombre;

  Categorias({this.id, required this.nombre});

  factory Categorias.fromJson(Map<String, dynamic> json) {
    return Categorias(id: json['id'], nombre: json['nombre']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }
}
