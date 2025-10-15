import 'dart:io';

import 'package:alopr/features/home/domain/usecase/upload_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  final UploadUsecase uploadUsecase;

  UploadCubit({required this.uploadUsecase}) : super(UploadInitial());

  Future<void> uploadImage({required File imageFile}) async {
    emit(LoadingUpload());
    try {
      final imageUrl = await uploadUsecase.call(imageFile);
      if (imageUrl != null) {
        emit(SuccessUpload(imageUrl));
      } else {
        emit(ErrorUpload("Failed to upload image."));
      }
    } catch (e) {
      emit(ErrorUpload(e.toString()));
    }
  }
}
