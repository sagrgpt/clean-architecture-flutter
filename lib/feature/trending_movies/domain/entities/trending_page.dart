import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_scope/feature/trending_movies/domain/entities/movie.dart';

class TrendingPage extends Equatable {
  final int pageNo;
  final int totalAvailablePages;
  final List<Movie> movies;

  TrendingPage({
    @required this.pageNo,
    @required int totalPage,
    @required this.movies,
  })  : assert(pageNo != null),
        assert(totalPage != null),
        assert(movies != null),
        totalAvailablePages = totalPage;

  @override
  List<Object> get props => [...movies];

  @override
  bool get stringify => true;
}
