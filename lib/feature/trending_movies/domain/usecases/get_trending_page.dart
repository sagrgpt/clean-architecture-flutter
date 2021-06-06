import 'package:dartz/dartz.dart';
import 'package:movie_scope/core/errors/failures.dart';
import 'package:movie_scope/feature/trending_movies/domain/entities/trending_page.dart';
import 'package:movie_scope/feature/trending_movies/domain/repositories/trending_movie_repository.dart';

class GetTrendingPage {
  final TrendingMovieRepository _repository;

  GetTrendingPage(this._repository);

  Future<Either<Failure, TrendingPage>> call(int pageNo) async {
    return _repository.getTrendingMoviePage(pageNo);
  }
}
