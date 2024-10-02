import 'package:formz/formz.dart';

// Define input validation errors
enum NumberInputFieldError { empty, notANumber }

// Extend FormzInput and provide the input type and error type.
class NumberInputField extends FormzInput<int?, NumberInputFieldError> {
  // Call super.pure to represent an unmodified form input.
  const NumberInputField.pure() : super.pure(null);

  // Call super.dirty to represent a modified form input.
  const NumberInputField.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == NumberInputFieldError.empty) return 'El campo es requerido';
    if (displayError == NumberInputFieldError.notANumber) return 'Solo se permiten números';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  NumberInputFieldError? validator(int? value) {
    if (value ==null) {
      return NumberInputFieldError.notANumber;
    }

    return null;
  }
}
