import 'dart:convert';

import 'package:alopr/features/authentication/data/model/api_register_model.dart';
import 'package:alopr/features/home/data/mapper/patient_data_mapper.dart';
import 'package:alopr/features/home/data/mapper/user_data_mapper.dart';
import 'package:alopr/features/home/data/model/api_complete_profile_model.dart';
import 'package:alopr/features/home/domain/entity/inputs/complete_profile_input.dart';
import 'package:alopr/features/home/domain/entity/model/user_data_model.dart';
import 'package:http/http.dart' as http;

class HomeDataSource {
  final String baseUrl =
      'https://68e6528121dd31f22cc51662.mockapi.io'; // can move to constants later

  Future<void> completeProfile(CompleteProfileInput input) async {
    final url = Uri.parse('$baseUrl/completeProfile');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(input.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    } else {
      throw Exception(
          'Failed to register. Status code: ${response.statusCode}');
    }
  }

  Future<List<UserDataModel>> getPatients() async {
    final usersUrl = Uri.parse('$baseUrl/register');
    final profileUrl = Uri.parse('$baseUrl/completeProfile');

    final usersResponse = await http.get(usersUrl);
    final profileResponse = await http.get(profileUrl);

    if (usersResponse.statusCode == 200 && profileResponse.statusCode == 200) {
      final List<dynamic> usersData = jsonDecode(usersResponse.body);
      final List<dynamic> profilesData = jsonDecode(profileResponse.body);

      // Map all register users
      final List<UserDataModel> allUsers = usersData
          .map((e) => ApiRegisterModel.fromJson(e).userDataMap())
          .toList();

      // Only patients
      final List<UserDataModel> patients =
          allUsers.where((u) => u.role?.toLowerCase() == 'patient').toList();

      // Merge each patient with their complete profile using registerId
      for (var patient in patients) {
        final profileJson =
            profilesData.cast<Map<String, dynamic>?>().firstWhere(
                  (p) => p?['registerId'] == patient.id,
                  orElse: () => {},
                );

        if (profileJson!.isNotEmpty) {
          patient.completedProfile =
              ApiCompleteProfileModel.fromJson(profileJson).patientDataMap();
        }
      }

      return patients;
    } else {
      throw Exception('Failed to load patients or profiles.');
    }
  }
}
