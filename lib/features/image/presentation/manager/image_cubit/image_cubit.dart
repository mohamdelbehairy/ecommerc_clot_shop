import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/image_repo.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit(this._imageRepo) : super(ImageInitial());

  final ImageRepo _imageRepo;

  File? image;
  Future<void> pickImage() async {
    emit(PickImageLoading());
    final result = await _imageRepo.pickImage();

    result.fold((e) {
      emit(ImageFailure(errorMessage: e.toString()));
      log("error from pick image: ${e.message}");
    }, (e) {
      if (e != null) {
        image = File(e.path);
        emit(PickImageSuccess());
      }
    });
  }

  Future<void> uploadImage({required File imageFile}) async {
    emit(UploadImageLoading());
    final result = await _imageRepo.uploadImage(imageFile);

    result.fold((e) {
      emit(ImageFailure(errorMessage: e.toString()));
      log("error from upload image: ${e.message}");
    }, (e) {
      emit(UploadImageSuccess());
    });
  }
}
