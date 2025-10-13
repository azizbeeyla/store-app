class ResetPasswordVerifyModel {
  final String email;
  final String code;

  ResetPasswordVerifyModel({required this.email, required this.code});
  Map<String, dynamic> toJson() {
    return {"email": email, "code": code};
  }
}
