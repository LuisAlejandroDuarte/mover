import 'package:frontend/domain/domain.dart';

class PersonaNaturalRepositorieImpl extends PersonaNaturalRepositories {
  final PersonaNaturalDatasource personaNaturalDatasource;

  PersonaNaturalRepositorieImpl({required this.personaNaturalDatasource});

  @override
  Future<PersonaNatural> crearPersonaNatural(
      PersonaNatural personaNatural) async {
    return personaNaturalDatasource.crearPersonaNatural(personaNatural);
  }
}
