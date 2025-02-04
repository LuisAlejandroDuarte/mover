class MultimediaVehiculo {
  final int? id;
  final int? multimedia;
  final int? vehiculoId;
  final String link;

  MultimediaVehiculo(
      {this.id, this.multimedia, this.vehiculoId, this.link = ''});

  factory MultimediaVehiculo.fromJson(Map<String, dynamic> json) {
    return MultimediaVehiculo(
        id: json['id'],
        multimedia: json['multimedia'],
        vehiculoId: json['vehiculoId'],
        link: json['link']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'multimedia': multimedia,
      'vehiculoId': vehiculoId,
      'link': link
    };
  }
}
