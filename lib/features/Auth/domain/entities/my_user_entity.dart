import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String userId;
  final String email;
  final String name;
  final String? phoneNumber;
  final String? address;
  final String? profileImage;
  

  const MyUserEntity({
    required this.userId,
    required this.email,
    required this.name,
    this.phoneNumber,
    this.address,
    this.profileImage,
  });

  MyUserEntity copyWith({
    String? userId,
    String? email,
    String? name,
    String? profileImage,
    String? address,
    String? phoneNumber,
  }) {
    return MyUserEntity(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'profileImage': profileImage,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      userId: doc['userId'],
      email: doc['email'],
      name: doc['name'],
      phoneNumber: doc['phoneNumber'],
      address: doc['address'],
      profileImage: doc['profileImage'],
    );
  }

  @override
  List<Object?> get props => [userId, email, name];
}
