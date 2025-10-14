import 'package:alopr/features/home/domain/entity/model/patient_profile_model.dart';

class UserDataModel {
  final String? fullName;
  final String? email;
  final String? phone;
  final String? role;
  final String? id;
  PatientProfileModel? completedProfile;

  UserDataModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.role,
    required this.id,
    this.completedProfile,
  });
}
