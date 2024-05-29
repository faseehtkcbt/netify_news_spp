import 'package:news_app/features/explore/domain/entity/source_detail_entity.dart';

class SourceDetailModel extends SourceDetailEntity {
  SourceDetailModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.url,
      required super.category,
      required super.language,
      required super.country});

  factory SourceDetailModel.fromJson(Map<String, dynamic> json) {
    return SourceDetailModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        url: json['url'],
        category: json['category'],
        language: json['language'],
        country: json['country']);
  }
}
