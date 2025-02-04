class Ciudad {
  final int? id;
  final int? departamentoId;
  final String nombre;
  final String codigo;

  Ciudad({
    this.id,
    this.departamentoId,
    this.nombre = '',
    this.codigo = '',
  });

  factory Ciudad.fromJson(Map<String, dynamic> json) {
    return Ciudad(
        id: json['id'],
        nombre: json['nombre'],
        departamentoId: json['departamentoId'],
        codigo: json['codigo']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'departamentoId': departamentoId,
      'codigo': codigo
    };
  }
}
