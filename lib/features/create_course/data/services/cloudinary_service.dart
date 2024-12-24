import 'dart:developer';

import 'package:cloudinary/cloudinary.dart';
import 'package:courseup/core/error/result.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CloudinaryService {
  final _cloudinary = Cloudinary.signedConfig(
    apiKey: dotenv.env['CLOUDINARY_API_KEY'] ?? '',
    apiSecret: dotenv.env['CLOUDINARY_API_SECRET'] ?? '',
    cloudName: dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '',
  );
  Future<Either<Success<String?>, FailureMessage>> uploadCourseImage(String imgPath) async {
    final response = await _cloudinary.upload(
        file: imgPath,
        folder: dotenv.env['CLOUDINARY_FOLDER'],
        resourceType: CloudinaryResourceType.auto,
        progressCallback: (count, total) {
          log('Uploading image from file with progress: $count/$total');
        });
    if(response.isSuccessful) {
      return left(Success(value: response.secureUrl));
    }
    return right(FailureMessage(failureMessage: response.error));
  }
}
