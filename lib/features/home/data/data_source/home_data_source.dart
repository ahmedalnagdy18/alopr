import 'dart:convert';
import 'dart:io';

import 'package:alopr/features/authentication/data/model/api_register_model.dart';
import 'package:alopr/features/home/data/mapper/patient_data_mapper.dart';
import 'package:alopr/features/home/data/mapper/user_data_mapper.dart';
import 'package:alopr/features/home/data/model/api_complete_profile_model.dart';
import 'package:alopr/features/home/domain/entity/inputs/complete_profile_input.dart';
import 'package:alopr/features/home/domain/entity/model/user_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

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

  Future<String?> upload(File imageFile) async {
    const String uploadUrl = 'https://upload.imagekit.io/api/v1/files/upload';
    const String privateApiKey = 'private_SFrIO3/IuBX/pFZTYCijAgl1RVY=';

    try {
      final request = http.MultipartRequest('POST', Uri.parse(uploadUrl));

      // Use basic authentication with private API key
      final authHeader =
          'Basic ${base64Encode(utf8.encode('$privateApiKey:'))}';
      request.headers['Authorization'] = authHeader;

      request.fields['fileName'] = imageFile.path.split('/').last;
      request.fields['useUniqueFileName'] = 'true';

      request.files.add(await http.MultipartFile.fromPath(
        'file',
        imageFile.path,
        contentType: MediaType('image', 'jpeg'),
      ));

      final response = await request.send();

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        final data = json.decode(respStr);
        return data['url'];
      } else {
        final error = await response.stream.bytesToString();
        print('❌ Failed to upload: ${response.statusCode}');
        print('💬 Response: $error');
        return null;
      }
    } catch (e) {
      print('Upload Error: $e');
      return null;
    }
  }

  Future<UserDataModel?> getUserCompleteProfile(String registerId) async {
    final usersUrl = Uri.parse('$baseUrl/register/$registerId');
    final profileUrl =
        Uri.parse('$baseUrl/completeProfile?registerId=$registerId');

    try {
      // Fetch the user basic info
      final userResponse = await http.get(usersUrl);
      if (userResponse.statusCode != 200) {
        throw Exception('Failed to load user data');
      }

      final userData = ApiRegisterModel.fromJson(jsonDecode(userResponse.body));

      // Fetch the profile data for that user
      final profileResponse = await http.get(profileUrl);
      if (profileResponse.statusCode != 200) {
        throw Exception('Failed to load profile data');
      }

      final List<dynamic> profileList = jsonDecode(profileResponse.body);
      ApiCompleteProfileModel? profile;
      if (profileList.isNotEmpty) {
        profile = ApiCompleteProfileModel.fromJson(profileList.first);
      }

      // Map both data models into a single UserDataModel with full info
      final user = userData.userDataMap();
      if (profile != null) {
        user.completedProfile = profile.patientDataMap();
      }

      return user;
    } catch (e) {
      print('❌ Error fetching user complete profile: $e');
      return null;
    }
  }

  Future<void> updateCompleteProfile(CompleteProfileInput input) async {
    if (input.id == null) {
      throw Exception("Profile ID is required for update");
    }

    final url = Uri.parse('$baseUrl/completeProfile/${input.id}');

    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(input.toJson()),
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception(
          'Failed to update profile. Status code: ${response.statusCode}');
    }
  }
}
