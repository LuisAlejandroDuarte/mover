import '../domain.dart';

abstract class PersonaNaturalDatasource {
  Future<PersonaNatural> crearPersonaNatural(PersonaNatural personaNatural);
}
