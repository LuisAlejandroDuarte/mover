import 'package:formz/formz.dart';

enum RePasswordValidationError { empty, mismatch }

class RePasswordValidate extends FormzInput<String, RePasswordValidationError> {
  final String password;

  // El constructor recibe el valor actual y la contraseña para comparar
  const RePasswordValidate.pure({required this.password}) : super.pure('');
  const RePasswordValidate.dirty({required this.password, required String value}) : super.dirty(value);

  @override
  RePasswordValidationError? validator(String? value) {
    if (value?.isEmpty ?? true) {
      return RePasswordValidationError.empty;
    }
    if (value != password) {
      return RePasswordValidationError.mismatch;
    }
    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == RePasswordValidationError.empty) return 'La confirmación de contraseña es requerida';
    if (displayError == RePasswordValidationError.mismatch) return 'Las contraseñas no coinciden';
    return null;
  }
}
