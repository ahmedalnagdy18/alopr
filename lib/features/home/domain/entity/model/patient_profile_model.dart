class PatientProfileModel {
  final String? caregiver;
  final String? caregiverNumber;
  final String? condition;
  final String? gender;
  final bool? hasDiseases;
  final String? specify;
  final bool? pregnantStatus;
  final String? id;
  final String? registerId;

  PatientProfileModel(
      {required this.caregiver,
      required this.caregiverNumber,
      required this.condition,
      required this.gender,
      required this.hasDiseases,
      required this.specify,
      required this.pregnantStatus,
      required this.id,
      required this.registerId});
}
