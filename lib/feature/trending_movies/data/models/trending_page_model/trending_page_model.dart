import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/trending_page.dart';
import '../movie_model/movie_model.dart';

part 'trending_page_model.g.dart';

@JsonSerializable()
class TrendingPageModel extends TrendingPage {
  @JsonKey(name: 'page')
  @override
  final int pageNo;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  @JsonKey(
    name: 'results',
    defaultValue: [],
    toJson: _movieModelListToJson,
  )
  @override
  final List<MovieModel> movies;

  TrendingPageModel({
    @required this.pageNo,
    @required this.totalPages,
    @required this.movies,
  }) : super(
          pageNo: pageNo,
          totalPage: totalPages,
          movies: movies,
        );

  factory TrendingPageModel.fromJson(Map<String, dynamic> json) =>
      _$TrendingPageModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingPageModelToJson(this);

  static List<Map<String, dynamic>> _movieModelListToJson(
    List<MovieModel> movieModelList,
  ) {
    return movieModelList.map((e) => e.toJson()).toList();
  }
}
