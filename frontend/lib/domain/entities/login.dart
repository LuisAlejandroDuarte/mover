class Login {

  final String userName;
  final String email;
  final String token;
  final String password;

  Login({this.userName="", this.token="",
         required this.email,         
         required this.password
    });
}