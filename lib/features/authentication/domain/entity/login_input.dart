class LoginInput {
  String email;
  String password;
  String role;

  LoginInput({
    required this.email,
    required this.password,
    required this.role,
  });
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'role': role,
    };
  }
}
