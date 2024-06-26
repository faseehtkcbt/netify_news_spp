import 'package:news_app/core/entity/source_entity.dart';

class SourceModel extends SourceEntity {
  SourceModel({required super.id, required super.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
