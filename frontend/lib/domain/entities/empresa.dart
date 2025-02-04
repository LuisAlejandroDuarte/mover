class Empresa {
  final int? id;
  final int? userId;
  final String? razonSocial;
  final String? nit;
  final String? representanteLegal;
  final String direccion;
  final String telefono;
  final String email;

  Empresa({
    this.id = 0,
    this.userId,
    this.razonSocial,
    this.nit,
    this.representanteLegal,
    this.direccion = "",
    this.telefono = "",
    this.email = "",
  });

  /// Método para convertir JSON en un objeto `Empresa`
  factory Empresa.fromJson(Map<String, dynamic> json) {
    return Empresa(
      id: json['id'],
      userId: json['userId'],
      razonSocial: json['razonSocial'],
      nit: json['nit'],
      representanteLegal: json['representanteLegal'],
      direccion: json['direccion'] ?? "",
      telefono: json['telefono'] ?? "",
      email: json['email'] ?? "",
    );
  }

  /// Método para convertir un objeto `Empresa` a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'razonSocial': razonSocial,
      'nit': nit,
      'representanteLegal': representanteLegal,
      'direccion': direccion,
      'telefono': telefono,
      'email': email,
    };
  }
}
