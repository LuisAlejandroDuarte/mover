class TipoIdentificacion {
  final int id;
  final String sigla;
  final String nombre;

  TipoIdentificacion({
    this.id=0,
    required this.sigla,
    this.nombre=''
  });

   factory TipoIdentificacion.fromJson(Map<String, dynamic> json) {
    return TipoIdentificacion(

      id : json['id'],
      sigla : json['sigla'],
      nombre : json['nombre']
   );
  }

    Map<String, dynamic> toJson() {
    return {
      'id':id,
      'sigla':sigla,
      'nombre':nombre
    };
  }


}