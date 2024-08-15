import 'dart:ui';

import 'package:exam_5_oy/data/model/fomrs_status.dart';

class ImageState {
  final String errorMessage;
  final FormsStatus status;
  final String imagePath;

  ImageState({
    required this.errorMessage,
    required this.status,
    required this.imagePath,
  });

  static ImageState initialValue() => ImageState(
        errorMessage: '',
        status: FormsStatus.initial,
        imagePath: '',
      );

  ImageState copyWith({
    String? errorMessage,
    FormsStatus? status,
    String? imagePath,
}) => ImageState(
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status,
        imagePath: imagePath ?? this.imagePath,
      );
}
