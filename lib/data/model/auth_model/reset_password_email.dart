class ResetPasswordEmailModel {
final String email;

ResetPasswordEmailModel({required this.email});

Map<String, dynamic> toJson() {
  return {
    "email": email,
  };
}
}