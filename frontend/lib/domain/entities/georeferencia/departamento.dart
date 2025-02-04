class Departamento {
  final int? id;
  final int? paisId;
  final String nombre;
  final String codigo;

  Departamento({
    this.id,
    this.paisId,
    this.nombre = '',
    this.codigo = '',
  });

  factory Departamento.fromJson(Map<String, dynamic> json) {
    return Departamento(
        id: json['id'],
        nombre: json['nombre'],
        paisId: json['paisId'],
        codigo: json['codigo']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nombre': nombre, 'paisId': paisId, 'codigo': codigo};
  }
}
