class RegisterInput {
  String id;
  String fullName;
  String email;
  String phone;
  String password;
  String role;

  RegisterInput({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.role,
  });
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'password': password,
      'role': role,
    };
  }
}
