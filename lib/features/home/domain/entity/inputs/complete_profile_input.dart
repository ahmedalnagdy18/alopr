class CompleteProfileInput {
  final String? caregiver;
  final String? caregiverNumber;
  final String? condition;
  final String? gender;
  final bool? hasDiseases;
  final String? specify;
  final bool? pregnantStatus;
  final String? id;
  final String? registerId;
  String? testImage;
  String? brainImage;

  CompleteProfileInput({
    required this.caregiver,
    required this.caregiverNumber,
    required this.condition,
    required this.gender,
    required this.hasDiseases,
    required this.specify,
    required this.pregnantStatus,
    required this.id,
    required this.registerId,
    this.testImage,
    this.brainImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'caregiver': caregiver,
      'caregiverNumber': caregiverNumber,
      'condition': condition,
      'gender': gender,
      'hasDiseases': hasDiseases,
      'specify': specify,
      'pregnantStatus': pregnantStatus,
      'id': id,
      'registerId': registerId,
      'testImage': testImage,
      'brainImage': brainImage,
    };
  }

  CompleteProfileInput copyWith({
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
      CompleteProfileInput(
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
