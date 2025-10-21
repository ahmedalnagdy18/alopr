import 'dart:convert';

import 'package:alopr/core/shared_prefrances/shared_prefrances.dart';
import 'package:alopr/features/authentication/data/model/api_register_model.dart';
import 'package:alopr/features/authentication/domain/entity/login_input.dart';
import 'package:alopr/features/authentication/domain/entity/register_input.dart';
import 'package:http/http.dart' as http;

class AuthDataSource {
  final String baseUrl =
      'https://68e6528121dd31f22cc51662.mockapi.io'; // can move to constants later

  Future<ApiRegisterModel> register(RegisterInput input) async {
    final url = Uri.parse('$baseUrl/register');

    // 1️⃣ Fetch all existing users
    final checkResponse = await http.get(url);

    if (checkResponse.statusCode == 200) {
      final List<dynamic> users = jsonDecode(checkResponse.body);

      // 2️⃣ Check if email already exists
      final existingUser = users.firstWhere(
        (u) => u['email'] == input.email,
        orElse: () => null,
      );
      if (existingUser != null) {
        throw Exception('Email already registered. Please login instead.');
      }
    } else {
      throw Exception('Failed to fetch users. Please try again.');
    }

    // 3️⃣ Continue registration if email is new
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(input.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final apiUser = ApiRegisterModel.fromJson(data);

      // ✅ 4️⃣ Save user ID to shared preferences
      await SharedPrefrance.instanc.saveRegisterId(apiUser.id);
      await SharedPrefrance.instanc.saveUserRole(apiUser.role);
      return ApiRegisterModel.fromJson(data);
    } else {
      throw Exception(
          'Failed to register. Status code: ${response.statusCode}');
    }
  }

  Future<ApiRegisterModel> login(LoginInput input) async {
    final url = Uri.parse('$baseUrl/register');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      // Find user that matches email and password only
      final user = data.firstWhere(
        (u) => u['email'] == input.email && u['password'] == input.password,
        orElse: () => null,
      );

      // If no user found → invalid credentials
      if (user == null) {
        throw Exception('Invalid email or password.');
      }

      // If role doesn’t match → role mismatch error
      if (user['role'] != input.role) {
        throw Exception(
            'Incorrect role. Please login as a ${user['role']} instead.');
      }
      final apiUser = ApiRegisterModel.fromJson(user);
      await SharedPrefrance.instanc.saveRegisterId(apiUser.id);
      await SharedPrefrance.instanc.saveUserRole(apiUser.role);
      // Everything matches → return user
      return apiUser;
    } else {
      throw Exception(
          'Failed to fetch users. Status code: ${response.statusCode}');
    }
  }

  Future<void> deleteAccount() async {
    final prefs = SharedPrefrance.instanc;
    final registerId = await prefs.getRegisterId();

    if (registerId == null) {
      return;
    }

    // 1️⃣ Get all complete profiles
    final getUrl = Uri.parse('$baseUrl/completeProfile');
    final getResponse = await http.get(getUrl);

    if (getResponse.statusCode == 200) {
      final List profiles = jsonDecode(getResponse.body);

      // 2️⃣ Get all profiles that belong to this registerId
      final targets = profiles
          .where((p) => p['registerId'].toString() == registerId.toString())
          .toList();

      if (targets.isNotEmpty) {
        // 3️⃣ Delete each matching profile
        for (final target in targets) {
          final completeId = target['id'].toString();
          final deleteUrl = Uri.parse(
            'https://68e6528121dd31f22cc51662.mockapi.io/register/$registerId/completeProfile/$completeId',
          );

          final deleteResponse = await http.delete(deleteUrl);

          if (deleteResponse.statusCode == 200 ||
              deleteResponse.statusCode == 204) {
          } else {
            // print(
            //     "⚠️ Failed to delete complete profile (ID: $completeId). Status: ${deleteResponse.statusCode}");
          }
        }
      } else {
        //  print("⚠️ No complete profiles found for registerId: $registerId");
      }
    } else {
      // print(
      //     "❌ Failed to fetch complete profiles. Status: ${getResponse.statusCode}");
    }

    // 4️⃣ Delete register
    final deleteRegisterUrl = Uri.parse('$baseUrl/register/$registerId');
    final deleteRegisterResponse = await http.delete(deleteRegisterUrl);

    if (deleteRegisterResponse.statusCode == 200 ||
        deleteRegisterResponse.statusCode == 204) {
    } else {
      // print(
      //     "⚠️ Failed to delete register. Status: ${deleteRegisterResponse.statusCode}");
    }

    // 5️⃣ Clear local data
    await prefs.clearAll();
  }
}
