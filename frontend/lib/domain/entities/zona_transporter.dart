class ZonaTransporter {
  final int? id;
  final String nombre;

  ZonaTransporter({this.id, this.nombre = ''});

  factory ZonaTransporter.fromJson(Map<String, dynamic> json) {
    return ZonaTransporter(id: json['id'], nombre: json['nombre']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nombre': nombre};
  }
}
