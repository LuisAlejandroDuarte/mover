class Pais {
  final int? id;
  final String nombre;
  final String? codigo;

  Pais({
    this.id,
    this.nombre = '',
    this.codigo = '',
  });

  factory Pais.fromJson(Map<String, dynamic> json) {
    return Pais(id: json['id'], nombre: json['nombre'], codigo: json['codigo']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nombre': nombre, 'codigo': codigo};
  }
}
