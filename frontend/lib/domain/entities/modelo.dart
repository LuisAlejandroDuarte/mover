class Modelo {
  final int id;
  final String nombre;

  Modelo({this.id = 0, this.nombre = ''});

  factory Modelo.fromJson(Map<String, dynamic> json) {
    return Modelo(id: json['id'], nombre: json['nombre']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nombre': nombre};
  }
}
