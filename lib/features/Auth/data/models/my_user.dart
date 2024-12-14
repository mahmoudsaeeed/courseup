import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String userId;
  final String email;
  final String name;
  final String profileImage;
  final String address;
  final String phoneNumber;

  const MyUser({
    this.userId = '',
    this.email = '',
    this.name = '',
    this.profileImage = '',
    this.address = '',
    this.phoneNumber = '',
  });

  // static const emptyUser = MyUser(
  //   userId: '',
  //   email: '',
  //   name: '',
  // );

  MyUser copyWith({
    String? userId,
    String? email,
    String? name,
    String? profileImage,
    String? address,
    String? phoneNumber,
  }) {
    return MyUser(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      email: email,
      name: name,
      address: address,
      phoneNumber: phoneNumber,
      profileImage: profileImage,
    );
  }

  factory MyUser.fromEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId,
      email: entity.email,
      name: entity.name,
      address: entity.address ?? '',
      phoneNumber: entity.phoneNumber ?? '',
      profileImage: entity.profileImage ?? '',
    );
  }

  @override
  List<Object?> get props => [userId, email, name];
}
