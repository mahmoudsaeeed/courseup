
import 'dart:developer';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:courseup/core/error/result.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CloudinaryService {
  final CloudinaryPublic _cloudinary;

  CloudinaryService()
      : _cloudinary = CloudinaryPublic(
          dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '',
          dotenv.env['CLOUDINARY_UPLOAD_PRESET'] ?? '',
          cache: false,
        );

  Future<Either<Success<String>, Failure>> uploadProfileImage(String imagePath) async {
    try {
      final response = await _cloudinary.uploadFile(
        CloudinaryFile.fromFile(imagePath, resourceType: CloudinaryResourceType.Image),
      );
      log(response.secureUrl);
      log('successfully uploaded');
      return left(Success(value: response.secureUrl));
    } catch (e) {
      log('!!!error!!!');
      return right(Failure(exception: e));
    }
  }
}
