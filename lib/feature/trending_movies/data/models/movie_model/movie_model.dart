import 'package:flutter/foundation.dart';

import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/movie.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends Movie {
  @JsonKey(name: 'original_title')
  @override
  final String title;

  @JsonKey(
    name: 'poster_path',
    defaultValue: '',
  )
  @override
  final String posterPath;

  @JsonKey(name: 'adult')
  @override
  final bool isAdult;

  MovieModel({
    @required id,
    @required overview,
    @required this.title,
    @required this.posterPath,
    @required this.isAdult,
  }) : super(
          id: id,
          title: title,
          overview: overview,
          posterPath: posterPath,
          isAdult: isAdult,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
