class EstadoVehiculo {
  final int? id;
  final String nombre;

  EstadoVehiculo({this.id, this.nombre = ''});

  factory EstadoVehiculo.fromJson(Map<String, dynamic> json) {
    return EstadoVehiculo(id: json['id'], nombre: json['nombre']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }
}
