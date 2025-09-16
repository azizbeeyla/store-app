class AuthModel {
  final String fullName;
  final String email;
  final String password;

  AuthModel({
    required this.fullName,
    required this.email,
    required this.password,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      fullName: json['fullName'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
    };
  }
}
