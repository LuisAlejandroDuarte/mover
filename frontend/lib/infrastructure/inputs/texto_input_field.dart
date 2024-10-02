import 'package:formz/formz.dart';

// Define input validation errors
enum TextoInputFieldError { empty,lenght }

// Extend FormzInput and provide the input type and error type.
class TextoInputField extends FormzInput<String, TextoInputFieldError> {
  // Call super.pure to represent an unmodified form input.
  const TextoInputField.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const TextoInputField.dirty( super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure)   return null;

    if ( displayError == TextoInputFieldError.empty) return 'El campo es requerido';
    if ( displayError == TextoInputFieldError.lenght) return 'El campo es menor de 3 caracteres';

    return null;

  }

  // Override validator to handle validating a given input value.
  @override
  TextoInputFieldError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return TextoInputFieldError.empty;
    if (value.length<3) return TextoInputFieldError.lenght;

    return null;
  }
}