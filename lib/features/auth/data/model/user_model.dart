import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.photoUrl,
      required super.email,
      required super.id,
      required super.name});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        email: map['email'] ?? '',
        name: map['username'] ?? '',
        id: map['uid'] ?? '',
        photoUrl: map['photoUrl']);
  }

  UserModel copyWith(
      {String? id, String? name, String? email, String? photoUrl}) {
    return UserModel(
        email: email ?? this.email,
        name: name ?? this.name,
        id: id ?? this.id,
        photoUrl: photoUrl ?? this.photoUrl);
  }
}
