import 'dart:io';

import 'package:alopr/features/home/domain/repository/home_repository.dart';

class UploadUsecase {
  final HomeRepository repository;

  UploadUsecase({required this.repository});

  Future<String?> call(File imageFile) async {
    return repository.upload(imageFile);
  }
}
