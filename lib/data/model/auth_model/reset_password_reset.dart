class ResetPasswordResetModel {
  final String email;
  final String code;
  final String password;

  ResetPasswordResetModel({
    required this.password,
    required this.email,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {"email": email, "code": code, "password": password};
  }
}
