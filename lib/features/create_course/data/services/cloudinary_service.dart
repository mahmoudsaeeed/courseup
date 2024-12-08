import 'package:cloudinary/cloudinary.dart';
import 'package:courseup/constants/cloudinary.dart';

class CloudinaryService {
  final _cloudinary = Cloudinary.signedConfig(
    apiKey: cloudinaryApiKey,
    apiSecret: cloudinaryApiSecret,
    cloudName: cloudinaryCloudName,
  );

  
}
