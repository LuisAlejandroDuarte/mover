import 'package:formz/formz.dart';

// Define input validation errors
enum UserNameError { empty,lenght }

// Extend FormzInput and provide the input type and error type.
class UserName extends FormzInput<String, UserNameError> {
  // Call super.pure to represent an unmodified form input.
  const UserName.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UserName.dirty( super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure)   return null;

    if ( displayError == UserNameError.empty) return 'El campo es requerido';
    if ( displayError == UserNameError.lenght) return 'El campo es menor de 6 caracteres';

    return null;

  }

  // Override validator to handle validating a given input value.
  @override
  UserNameError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return UserNameError.empty;
    if (value.length<6) return UserNameError.lenght;

    return null;
  }
}