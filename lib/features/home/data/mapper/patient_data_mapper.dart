import 'package:alopr/features/home/data/model/api_complete_profile_model.dart';
import 'package:alopr/features/home/domain/entity/model/patient_profile_model.dart';

extension ConvertUserDataToApi on ApiCompleteProfileModel {
  PatientProfileModel patientDataMap() {
    return PatientProfileModel(
      id: id,
      caregiver: caregiver,
      caregiverNumber: caregiverNumber,
      condition: condition,
      gender: gender,
      hasDiseases: hasDiseases,
      pregnantStatus: pregnantStatus,
      registerId: registerId,
      specify: specify,
    );
  }
}
