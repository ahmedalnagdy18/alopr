class ApiRegisterModel {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String role;

  ApiRegisterModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.role,
  });

  // Factory constructor to create an instance from JSON
  factory ApiRegisterModel.fromJson(Map<String, dynamic> json) {
    return ApiRegisterModel(
      id: json['id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      password: json['password'] ?? '',
      role: json['role'] ?? '',
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'password': password,
      'role': role,
    };
  }
}
