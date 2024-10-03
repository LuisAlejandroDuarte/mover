class EstadoOferta {
  final int? id;
  final String nombre;

  EstadoOferta({this.id, this.nombre = ''});

  factory EstadoOferta.fromJson(Map<String, dynamic> json) {
    return EstadoOferta(id: json['id'], nombre: json['nombre']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nombre': nombre};
  }
}
