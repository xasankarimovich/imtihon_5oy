import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:exam_5_oy/cubit/image_cubit/image_state.dart';
import 'package:exam_5_oy/data/model/fomrs_status.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageState.initialValue());

  Future<void> insertImage({required ImageSource source}) async {
    emit(
      state.copyWith(
        status: FormsStatus.loading,
      ),
    );
    final ImagePicker picker = ImagePicker();
    try {
      XFile? pickedFile = await picker.pickImage(source: source);
      if (pickedFile == null) {
        emit(
          state.copyWith(
            status: FormsStatus.error,
            errorMessage: "Hech qanday rasm tanlanmadi",
          ),
        );
      } else {
        Reference storageRef = FirebaseStorage.instance
            .ref()
            .child("file/images/${pickedFile.name}");
        File file = File(pickedFile.path);
        var uploadFile = await storageRef.putFile(file);
        String downloadUrl = await uploadFile.ref.getDownloadURL();
        emit(
          state.copyWith(
            status: FormsStatus.success,
            imagePath: downloadUrl,
          ),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(
          status: FormsStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> editImage({required String imagePath}) async {
    emit(
      state.copyWith(
        status: FormsStatus.loading,
      ),
    );
    try{
      await FirebaseStorage.instance.refFromURL(imagePath).delete();
      insertImage(source: ImageSource.gallery);
    }catch(error){
      emit(
        state.copyWith(
          status: FormsStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
