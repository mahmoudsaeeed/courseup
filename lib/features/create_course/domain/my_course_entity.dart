class MyCourseEntity {
  final String courseId;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> videosUrl;
  final double price;
  final String publisherId;

  MyCourseEntity({
    required this.courseId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.videosUrl,
    required this.price,
    required this.publisherId,
  });

  Map<String, Object?> toDocument() {
    return {
      'courseId': courseId,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'videosUrl': videosUrl,
      'price': price,
      'publisherId': publisherId,
    };
  }

  static MyCourseEntity fromDocument(Map<String, dynamic> doc) {
    return MyCourseEntity(
      courseId: doc['courseId'],
      title: doc['title'],
      description: doc['description'],
      imageUrl: doc['imageUrl'],
      videosUrl: List<String>.from(doc['videosUrl'] ?? []),
      price: doc['price'],
      publisherId: doc['publisherId'],
    );
  }

}
