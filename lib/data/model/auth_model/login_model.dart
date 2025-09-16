class LoginModel {
  final String email;
  final String password;

  LoginModel({
    required this.email,
    required this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['login'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': email,
      'password': password,
    };
  }
}
