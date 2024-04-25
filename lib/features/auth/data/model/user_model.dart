import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  final String email;
  final String id;
  final String name;

  UserModel({required this.email, required this.id, required this.name})
      : super(email: email, id: id, name: name);

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
