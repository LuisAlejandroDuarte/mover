class ParametrosVehiculo {
  final int? id;
  final String nombre;

  ParametrosVehiculo({this.id, this.nombre = ''});

  factory ParametrosVehiculo.fromJson(Map<String, dynamic> json) {
    return ParametrosVehiculo(id: json['id'], nombre: json['nombre']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nombre': nombre};
  }
}
