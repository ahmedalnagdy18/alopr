class ApiCompleteProfileModel {
  ApiCompleteProfileModel({
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

  factory ApiCompleteProfileModel.fromJson(Map<String, dynamic> json) {
    return ApiCompleteProfileModel(
      caregiver: json["caregiver"],
      caregiverNumber: json["caregiverNumber"],
      condition: json["condition"],
      gender: json["gender"],
      hasDiseases: json["hasDiseases"],
      specify: json["specify"],
      pregnantStatus: json["pregnantStatus"],
      id: json["id"],
      registerId: json["registerId"],
      brainImage: json["brainImage"],
      testImage: json["testImage"],
    );
  }
}
