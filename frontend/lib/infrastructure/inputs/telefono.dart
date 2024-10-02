import 'package:formz/formz.dart';

// Define input validation errors
enum TelefonoError { empty,format }

// Extend FormzInput and provide the input type and error type.
class Telefono extends FormzInput<String, TelefonoError> {
  // Call super.pure to represent an unmodified form input.
  const Telefono.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Telefono.dirty( super.value) : super.dirty();

  static final RegExp telefonoRegExp = RegExp(
    r'^[0-9()+]*$',
  );

  String? get errorMessage {
    if (isValid || isPure)   return null;

   if ( displayError == TelefonoError.empty) return 'El campo es requerido';
   if ( displayError == TelefonoError.format) return 'No tiene formato de número de teléfono';

    return null;

  }

  // Override validator to handle validating a given input value.
  @override
  TelefonoError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return TelefonoError.empty;
    if (!telefonoRegExp.hasMatch(value)) return TelefonoError.format;

    return null;
  }
}