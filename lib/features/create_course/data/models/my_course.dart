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
    this.videosUrl = const[],
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
      publisherId: publisherId
    );
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

}
