import 'dart:convert';

import 'package:movie_scope/feature/trending_movies/data/models/movie_model/movie_model.dart';
import 'package:movie_scope/feature/trending_movies/domain/entities/movie.dart';
import 'package:test/test.dart';

import '../../../../../../fixtures/fixture_reader.dart';

const _MOVIE_JSON = 'movie.json';
const _MOVIE_WITH_NULLS = 'movie_with_nulls.json';
const _MOVIE_WITH_VARIABLE_TITLES =
    'movie_with_different_title_and_original_title.json';

void main() {
  final MovieModel tMovieModel =
      _buildMovieModelFromConstructor(_getJsonFrom(_MOVIE_JSON));
  final MovieModel tMovieModeForDifferentTitles =
      _buildMovieModelFromConstructor(
          _getJsonFrom(_MOVIE_WITH_VARIABLE_TITLES));

  test(
    'should be a subclass of Movie entity',
    () {
      //assert
      expect(tMovieModel, isA<Movie>());
    },
  );

  group('From Json', () {
    test(
      'should return a valid model when json is passed',
      () async {
        //act
        final result = MovieModel.fromJson(_getJsonFrom(_MOVIE_JSON));
        //assert
        expect(result, tMovieModel);
      },
    );

    test(
      'should return a valid model when json is passed has null [posterPath]',
      () async {
        //act
        final result = MovieModel.fromJson(_getJsonFrom(_MOVIE_WITH_NULLS));
        //assert
        assert(result.posterPath != null);
      },
    );

    test(
      'should use [original_title] when creating model from json',
      () async {
        //act
        final result =
            MovieModel.fromJson(_getJsonFrom(_MOVIE_WITH_VARIABLE_TITLES));
        //assert
        expect(result, tMovieModeForDifferentTitles);
      },
    );
  });

  group('To Json', () {
    test(
      'should return a JSON map containing proper data',
      () async {
        //act
        final result = tMovieModel.toJson();
        //assert
        final expectedMap = {
          "original_title": "Cruella",
          "id": 1,
          "overview": "Overview of the movie",
          "adult": false,
          "poster_path": "/pathToPoster",
        };
        expect(result, expectedMap);
      },
    );
  });
}

MovieModel _buildMovieModelFromConstructor(Map<String, dynamic> json) =>
    MovieModel(
      id: json['id'],
      title: json['original_title'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      isAdult: json['adult'],
    );

Map<String, dynamic> _getJsonFrom(String fileName) =>
    json.decode(fixture(fileName));
