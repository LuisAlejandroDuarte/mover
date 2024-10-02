import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../../infrastructure/infrastructure.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(state.copyWith(
        formStatus: FormStatus.validating,
        tipoIdentificacion: state.tipoIdentificacion,
        identificacion: TextoInputField.dirty(state.identificacion.value),
        userName: UserName.dirty(state.userName.value),
        nombres: TextoInputField.dirty(state.nombres.value),
        apellidos: TextoInputField.dirty(state.apellidos.value),
        direccion: TextoInputField.dirty(state.direccion.value),
        telefono: Telefono.dirty(state.telefono.value),
        password: Password.dirty(state.password.value),
        repassword: RePasswordValidate.dirty(
            password: state.password.value, value: state.repassword.value),
        email: Email.dirty(state.email.value),
        isValid: Formz.validate([
          state.userName,
          state.nombres,
          state.apellidos,
          state.direccion,
          state.telefono,
          state.email,
          state.password,
          state.repassword
        ])));
  }

  void tipoIdentificacionChanged(int? value) {
    final tipoIdentificacion = NumberInputField.dirty(value);
    emit(state.copyWith(
        tipoIdentificacion: tipoIdentificacion,
        isValid: Formz.validate([
          tipoIdentificacion,
          state.identificacion,
          state.nombres,
          state.apellidos,
          state.direccion,
          state.email,
          state.telefono,
          state.userName,
          state.password,
          state.repassword
        ])));
  }

  void identificacionChanged(String value) {
    final identificacion = TextoInputField.dirty(value);
    emit(state.copyWith(
        identificacion: identificacion,
        isValid: Formz.validate([
          identificacion,
          state.tipoIdentificacion,
          state.nombres,
          state.apellidos,
          state.direccion,
          state.email,
          state.telefono,
          state.userName,
          state.password,
          state.repassword
        ])));
  }

  void nombresChanged(String value) {
    final nombres = TextoInputField.dirty(value);
    emit(state.copyWith(
        nombres: nombres,
        isValid: Formz.validate([
          nombres,
          state.tipoIdentificacion,
          state.identificacion,
          state.apellidos,
          state.direccion,
          state.email,
          state.telefono,
          state.userName,
          state.password,
          state.repassword
        ])));
  }

  void apellidosChanged(String value) {
    final apellidos = TextoInputField.dirty(value);
    emit(state.copyWith(
        apellidos: apellidos,
        isValid: Formz.validate([
          apellidos,
          state.tipoIdentificacion,
          state.identificacion,
          state.nombres,
          state.direccion,
          state.email,
          state.telefono,
          state.userName,
          state.password,
          state.repassword
        ])));
  }

  void direccionChanged(String value) {
    final direccion = TextoInputField.dirty(value);
    emit(state.copyWith(
        direccion: direccion,
        isValid: Formz.validate([
          direccion,
          state.tipoIdentificacion,
          state.identificacion,
          state.nombres,
          state.apellidos,
          state.email,
          state.telefono,
          state.userName,
          state.password,
          state.repassword
        ])));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
        email: email,
        isValid: Formz.validate([
          email,
          state.tipoIdentificacion,
          state.identificacion,
          state.nombres,
          state.apellidos,
          state.direccion,
          state.telefono,
          state.userName,
          state.password,
          state.repassword
        ])));
  }

  void telefonoChanged(String value) {
    final telefono = Telefono.dirty(value);
    emit(state.copyWith(
        telefono: telefono,
        isValid: Formz.validate([
          telefono,
          state.tipoIdentificacion,
          state.identificacion,
          state.nombres,
          state.apellidos,
          state.direccion,
          state.email,
          state.userName,
          state.password,
          state.repassword
        ])));
  }

  void userNameChanged(String value) {
    final userName = UserName.dirty(value);
    emit(state.copyWith(
        userName: userName,
        isValid: Formz.validate([
          userName,
          state.tipoIdentificacion,
          state.identificacion,
          state.nombres,
          state.apellidos,
          state.direccion,
          state.email,
          state.telefono,
          state.password,
          state.repassword
        ])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);

    emit(state.copyWith(
        password: password,
        repassword: RePasswordValidate.dirty(
            password: password.value, value: state.repassword.value),
        isValid: Formz.validate([
          password,
          state.tipoIdentificacion,
          state.identificacion,
          state.nombres,
          state.apellidos,
          state.direccion,
          state.email,
          state.telefono,
          state.userName,
          state.repassword
        ])));
  }

  void rePasswordChanged(String value) {
    final repassword =
        RePasswordValidate.dirty(password: state.password.value, value: value);

    emit(state.copyWith(
        repassword: repassword,
        isValid: Formz.validate([
          repassword,
          state.tipoIdentificacion,
          state.identificacion,
          state.nombres,
          state.apellidos,
          state.direccion,
          state.email,
          state.telefono,
          state.userName,
          state.password
        ])));
  }
}
