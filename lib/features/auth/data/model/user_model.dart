import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.id, required super.name});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        email: map['email'] ?? '',
        name: map['name'] ?? '',
        id: map['id'] ?? '');
  }

  UserModel copyWith({String? id, String? name, String? email}) {
    return UserModel(
        email: email ?? this.email, name: name ?? this.name, id: id ?? this.id);
  }
}
