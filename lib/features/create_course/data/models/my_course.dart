import 'package:courseup/core/constants.dart';
import 'package:courseup/features/create_course/domain/my_course_entity.dart';

enum CourseStatus {
  pending,
  active,
  removed,
}

class MyCourse {
  String courseId;
  String title;
  String description;
  String imageUrl;
  List<String> videosUrl;
  double price;
  int numberOfRatings;
  int numberOfBuyers;
  CourseStatus courseStatus;
  String publisherId;
  String category;
  double rating;

  MyCourse({
    this.courseId = '',
    this.title = '',
    this.description = '',
    this.imageUrl = '',
    this.videosUrl = const [],
    this.price = 0.0,
    this.numberOfRatings = 0,
    this.numberOfBuyers = 0,
    this.courseStatus = CourseStatus.pending,
    this.publisherId = '',
    this.category = '',
    this.rating = 5.0,
  });

  MyCourse copyWith({
    String? courseId,
    String? title,
    String? description,
    String? imageUrl,
    List<String>? videosUrl,
    double? price,
    int? numberOfRatings,
    int? numberOfBuyers,
    CourseStatus? courseStatus,
    String? publisherId,
    String? category,
    double? rating,
  }) {
    return MyCourse(
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      videosUrl: videosUrl ?? this.videosUrl,
      price: price ?? this.price,
      numberOfRatings: numberOfRatings ?? this.numberOfRatings,
      numberOfBuyers: numberOfBuyers ?? this.numberOfBuyers,
      courseStatus: courseStatus ?? this.courseStatus,
      publisherId: publisherId ?? this.publisherId,
      category: category ?? this.category,
      rating: rating ?? this.rating,
    );
  }

  MyCourseEntity toEntity() {
    return MyCourseEntity(
        courseId: courseId,
        title: title,
        description: description,
        imageUrl: imageUrl,
        videosUrl: videosUrl,
        price: price,
        publisherId: publisherId);
  }

  MyCourse fromEntity(MyCourseEntity entity) {
    return MyCourse(
        courseId: entity.courseId,
        title: entity.title,
        description: entity.description,
        imageUrl: entity.imageUrl,
        videosUrl: entity.videosUrl,
        price: entity.price,
        publisherId: entity.publisherId);
  }

  factory MyCourse.fromJson(Map<String, dynamic> json) {
    /* 
    ? MyDBKeys is a class exist in contants folder in core folder
    ? it store the keys of my db used

    */
    return MyCourse(
      title: json[MyDBKeys.title],
      category: json[MyDBKeys.category],
      courseId: MyDBKeys.courseId,
      courseStatus: json[MyDBKeys.status],
      description: json[MyDBKeys.description],
      imageUrl: json[MyDBKeys.imageUrl],
      numberOfBuyers: json[MyDBKeys.numberOfBuyers],
      numberOfRatings: json[MyDBKeys.numberOfRatings],
      price: json[MyDBKeys.price],
      publisherId: json[MyDBKeys.publisherId],
      rating: json[MyDBKeys.rate],
      videosUrl: json[MyDBKeys.videosUrl],
    );
  }

  void toJson() {
    Map<String, dynamic> jsonFile = {};
    jsonFile[MyDBKeys.courseId] = courseId;
    jsonFile[MyDBKeys.title] = title;
    jsonFile[MyDBKeys.description] = description;
    jsonFile[MyDBKeys.category] = category;
    jsonFile[MyDBKeys.imageUrl] = imageUrl;
    jsonFile[MyDBKeys.numberOfBuyers] = numberOfBuyers;
    jsonFile[MyDBKeys.numberOfRatings] = numberOfRatings;
    jsonFile[MyDBKeys.videosUrl] = videosUrl;
    jsonFile[MyDBKeys.publisherId] = publisherId;
    jsonFile[MyDBKeys.status] = courseStatus;
    jsonFile[MyDBKeys.rate] = rating;
    jsonFile[MyDBKeys.price] = price;
  }
}
