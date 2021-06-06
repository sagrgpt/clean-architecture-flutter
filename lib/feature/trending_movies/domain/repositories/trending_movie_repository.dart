import 'package:dartz/dartz.dart';
import 'package:movie_scope/core/errors/failures.dart';
import 'package:movie_scope/feature/trending_movies/domain/entities/trending_page.dart';

abstract class TrendingMovieRepository {
  Future<Either<Failure, TrendingPage>> getTrendingMoviePage(int pageNo);
}
