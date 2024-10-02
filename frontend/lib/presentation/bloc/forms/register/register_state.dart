part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final NumberInputField tipoIdentificacion;
  final TextoInputField identificacion;
  final UserName userName;
  final TextoInputField nombres;
  final TextoInputField apellidos;
  final TextoInputField direccion;
  final Email email;
  final Telefono telefono;
  final Password password;
  final RePasswordValidate repassword;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.isValid = false,
      this.tipoIdentificacion = const NumberInputField.pure(),
      this.userName = const UserName.pure(),
      this.nombres = const TextoInputField.pure(),
      this.apellidos = const TextoInputField.pure(),
      this.direccion = const TextoInputField.pure(),
      this.email = const Email.pure(),
      this.telefono = const Telefono.pure(),
      this.identificacion = const TextoInputField.pure(),
      this.password = const Password.pure(),
      this.repassword = const RePasswordValidate.pure(password: '')});

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    NumberInputField? tipoIdentificacion,
    UserName? userName,
    TextoInputField? nombres,
    TextoInputField? apellidos,
    TextoInputField? direccion,
    Email? email,
    Telefono? telefono,
    TextoInputField? identificacion,
    Password? password,
    RePasswordValidate? repassword,
  }) =>
      RegisterFormState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        tipoIdentificacion: tipoIdentificacion ?? this.tipoIdentificacion,
        userName: userName ?? this.userName,
        nombres: nombres ?? this.nombres,
        apellidos: apellidos ?? this.apellidos,
        direccion: direccion ?? this.direccion,
        email: email ?? this.email,
        telefono: telefono ?? this.telefono,
        identificacion: identificacion ?? this.identificacion,
        password: password ?? this.password,
        repassword: repassword ?? this.repassword,
      );

  @override
  List<Object> get props => [
        formStatus,
        isValid,
        tipoIdentificacion,
        userName,
        nombres,
        apellidos,
        direccion,
        email,
        telefono,
        identificacion,
        password,
        repassword
      ];
}
