// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel(
    id: json['id'],
    overview: json['overview'],
    title: json['original_title'] as String,
    posterPath: json['poster_path'] as String ?? '',
    isAdult: json['adult'] as bool,
  );
}

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'overview': instance.overview,
      'original_title': instance.title,
      'poster_path': instance.posterPath,
      'adult': instance.isAdult,
    };
