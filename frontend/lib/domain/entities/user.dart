import '../domain.dart';

enum TipoNaturaleza {
  persona,
  empresa;

  int get value {
    switch (this) {
      case TipoNaturaleza.persona:
        return 1;
      case TipoNaturaleza.empresa:
        return 2;
    }
  }
}

class User {
  final int id;
  final String userName;
  final String token;
  final String password;
  final int? tipoUserId;
  final int? tipoNaturaleza;
  final DateTime? ultimaSesion;
  final int estadoUsuarioId;
  final List<Equipo> listEquipos;
  final List<ConductorAutorizado> listConductorAutorizado;
  final PersonaNatural personaNatural;
  final Empresa empresa;

  User({
    this.id = 0,
    this.userName = '',
    this.token = "",
    this.password = "",
    this.tipoUserId,
    this.tipoNaturaleza,
    this.ultimaSesion,
    this.estadoUsuarioId = 1,
    List<Equipo>? listEquipos,
    List<ConductorAutorizado>? listConductorAutorizado,
    PersonaNatural? personaNatural,
    Empresa? empresa,
  })  : listEquipos = listEquipos ?? [],
        listConductorAutorizado = listConductorAutorizado ?? [],
        personaNatural = personaNatural ?? PersonaNatural(),
        empresa = empresa ?? Empresa();

  User copyWith({
    int? id,
    String? userName,
    String? token,
    String? password,
    int? tipoUserId,
    int? tipoNaturaleza,
    DateTime? ultimaSesion,
    int? estadoUsuarioId,
    List<Equipo>? listEquipos,
    List<ConductorAutorizado>? listConductorAutorizado,
    PersonaNatural? personaNatural,
    Empresa? empresa,
  }) {
    return User(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      token: token ?? this.token,
      password: password ?? this.password,
      tipoUserId: tipoUserId ?? this.tipoUserId,
      tipoNaturaleza: tipoNaturaleza ?? this.tipoNaturaleza,
      ultimaSesion: ultimaSesion ?? this.ultimaSesion,
      estadoUsuarioId: estadoUsuarioId ?? this.estadoUsuarioId,
      listEquipos: listEquipos ?? this.listEquipos,
      listConductorAutorizado:
          listConductorAutorizado ?? this.listConductorAutorizado,
      personaNatural: personaNatural ?? this.personaNatural,
      empresa: empresa ?? this.empresa,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      userName: json['userName'] ?? '',
      password: json['password'] ?? '',
      token: json['token'] ?? '',
      tipoUserId: json['tipoUserId'],
      tipoNaturaleza: json['tipoNaturaleza'],
      ultimaSesion: json['ultimaSesion'] != null
          ? DateTime.tryParse(json['ultimaSesion'])
          : null,
      estadoUsuarioId: json['estadoUsuarioId'] ?? 1,
      listEquipos: (json['listEquipos'] as List?)
              ?.map((e) => Equipo.fromJson(e))
              .toList() ??
          [],
      listConductorAutorizado: (json['listConductorAutorizados'] as List?)
              ?.map((e) => ConductorAutorizado.fromJson(e))
              .toList() ??
          [],
      personaNatural: json['personaNatural'] != null
          ? PersonaNatural.fromJson(json['personaNatural'])
          : PersonaNatural(),
      empresa: json['empresa'] != null
          ? Empresa.fromJson(json['empresa'])
          : Empresa(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'password': password,
      'token': token,
      'tipoUserId': tipoUserId,
      'tipoNaturaleza': tipoNaturaleza,
      'ultimaSesion': ultimaSesion?.toIso8601String(),
      'estadoUsuarioId': estadoUsuarioId,
      'listEquipos': listEquipos.map((e) => e.toJson()).toList(),
      'listConductorAutorizados':
          listConductorAutorizado.map((e) => e.toJson()).toList(),
      'personaNatural': personaNatural.toJson(),
      'empresa': empresa.toJson(),
    };
  }
}
