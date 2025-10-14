class CompleteProfileInput {
  final String caregiver;
  final String caregiverNumber;
  final String condition;
  final String gender;
  final bool hasDiseases;
  final String? specify;
  final bool pregnantStatus;
  final String? id;
  final String? registerId;

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
    };
  }
}
