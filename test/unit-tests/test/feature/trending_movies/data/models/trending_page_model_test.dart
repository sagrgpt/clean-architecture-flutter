import 'dart:convert';
import 'package:movie_scope/feature/trending_movies/data/models/movie_model/movie_model.dart';
import 'package:movie_scope/feature/trending_movies/data/models/trending_page_model/trending_page_model.dart';
import 'package:movie_scope/feature/trending_movies/domain/entities/trending_page.dart';
import 'package:test/test.dart';
import '../../../../../../fixtures/fixture_reader.dart';

void main() {
  final tTrendingPageModel = _getModelFromConstructor(
    _getJsonFrom('trending_page.json'),
  );

  final tTrendingPageModelWithoutMovies = _getModelFromConstructor(
    _getJsonFrom('trending_page_without_movies.json'),
  );

  test(
    'should be a subclass of [TrendingPage] entity',
    () async {
      //assert
      expect(tTrendingPageModel, isA<TrendingPage>());
    },
  );

  group('from json', () {
    test(
      'should return a valid model when json is passed',
      () async {
        //act
        final result =
            TrendingPageModel.fromJson(_getJsonFrom('trending_page.json'));
        //assert
        expect(result, tTrendingPageModel);
      },
    );

    test(
      'should contain empty movie model list when movie list is not present',
      () async {
        //arrange

        //act
        final result = TrendingPageModel.fromJson(
            _getJsonFrom('trending_page_without_movies.json'));
        //assert
        assert(result.movies != null);
        assert(result.movies.isEmpty);
      },
    );
  });

  group('to json', () {
    test(
      'should return a JSON map containing proper data',
      () async {
        //act
        final result = tTrendingPageModel.toJson();
        //assert
        final expectedMap = {
          "page": 1,
          "total_pages": 2,
          "results": tTrendingPageModel.movies.map((e) => e.toJson()).toList(),
        };
        expect(result, expectedMap);
      },
    );

    test(
      'should return a JSON map containing proper data when movie list is empty',
      () async {
        //act
        final result = tTrendingPageModelWithoutMovies.toJson();
        //assert
        final expectedMap = {
          "page": 1,
          "total_pages": 2,
          "results": [],
        };
        expect(result, expectedMap);
      },
    );
  });
}

TrendingPageModel _getModelFromConstructor(Map<String, dynamic> json) {
  final movieModelList = json['results'] != null
      ? (json['results'] as List).map((e) => MovieModel.fromJson(e)).toList()
      : null;
  return TrendingPageModel(
    pageNo: json['page'],
    totalPages: json['total_pages'],
    movies: movieModelList ?? [],
  );
}

Map<String, dynamic> _getJsonFrom(String fileName) =>
    json.decode(fixture(fileName));
