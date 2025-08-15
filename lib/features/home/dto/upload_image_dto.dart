import 'package:dio/dio.dart';

class UploadImageDTO {
  final MultipartFile file;

  UploadImageDTO({required this.file});

  FormData toFormData() {
    return FormData.fromMap({'file': file});
  }
}
