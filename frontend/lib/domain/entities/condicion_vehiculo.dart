class CondicionVehiculo {
  final int? id;
  final String nombre;

  CondicionVehiculo({this.id, this.nombre = ''});

  factory CondicionVehiculo.fromJson(Map<String, dynamic> json) {
    return CondicionVehiculo(id: json['id'], nombre: json['nombre']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }
}
