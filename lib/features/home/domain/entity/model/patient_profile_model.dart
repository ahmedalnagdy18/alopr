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
  final String? testImage;
  final String? brainImage;

  PatientProfileModel({
    required this.caregiver,
    required this.caregiverNumber,
    required this.condition,
    required this.gender,
    required this.hasDiseases,
    required this.specify,
    required this.pregnantStatus,
    required this.id,
    required this.registerId,
    required this.testImage,
    required this.brainImage,
  });

  PatientProfileModel copyWith({
    String? caregiver,
    String? caregiverNumber,
    String? condition,
    String? gender,
    bool? hasDiseases,
    String? specify,
    bool? pregnantStatus,
    String? testImage,
    String? brainImage,
    String? id,
    String? registerId,
  }) =>
      PatientProfileModel(
        caregiver: caregiver ?? this.caregiver,
        caregiverNumber: caregiverNumber ?? this.caregiverNumber,
        condition: condition ?? this.condition,
        gender: gender ?? this.gender,
        hasDiseases: hasDiseases ?? this.hasDiseases,
        specify: specify ?? this.specify,
        pregnantStatus: pregnantStatus ?? this.pregnantStatus,
        testImage: testImage ?? this.testImage,
        brainImage: brainImage ?? this.brainImage,
        id: id ?? this.id,
        registerId: registerId ?? this.registerId,
      );
}
