// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingPageModel _$TrendingPageModelFromJson(Map<String, dynamic> json) {
  return TrendingPageModel(
    pageNo: json['page'] as int,
    totalPages: json['total_pages'] as int,
    movies: (json['results'] as List)
            ?.map((e) => e == null
                ? null
                : MovieModel.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$TrendingPageModelToJson(TrendingPageModel instance) =>
    <String, dynamic>{
      'page': instance.pageNo,
      'total_pages': instance.totalPages,
      'results': TrendingPageModel._movieModelListToJson(instance.movies),
    };
