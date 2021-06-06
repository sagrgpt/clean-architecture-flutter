import 'package:movie_scope/feature/trending_movies/domain/entities/movie.dart';
import 'package:movie_scope/feature/trending_movies/domain/entities/trending_page.dart';
import 'package:movie_scope/feature/trending_movies/domain/repositories/trending_movie_repository.dart';
import 'package:movie_scope/feature/trending_movies/domain/usecases/get_trending_page.dart';
import 'package:test/test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

class MockTrendingMovieRepository extends Mock
    implements TrendingMovieRepository {}

void main() {
  MockTrendingMovieRepository repository;
  GetTrendingPage usecase;

  setUp(() {
    repository = MockTrendingMovieRepository();
    usecase = GetTrendingPage(repository);
  });

  final tMovie = Movie(
    title: "Matrix",
    id: 1221,
    posterPath: "/pathToMovie",
    overview: "This is movie on the system we live in",
  );

  final tTrendingPage = TrendingPage(
    pageNo: 1,
    totalPage: 10,
    movies: [tMovie, tMovie, tMovie],
  );

  test(
    'should call repository to get a trending page',
    () async {
      //arrange
      _setUpMockTrendingPageFromRepository(
        repository,
        tTrendingPage,
      );
      //act
      await usecase(1);
      //assert
      verify(repository.getTrendingMoviePage(1));
    },
  );

  test(
    'should call repository to fetch only the required page no',
    () async {
      //arrange
      _setUpMockTrendingPageFromRepository(
        repository,
        tTrendingPage,
      );
      //act
      await usecase(2);
      //assert
      verify(repository.getTrendingMoviePage(2));
    },
  );

  test(
    'should return a trendingPage',
    () async {
      //arrange
      _setUpMockTrendingPageFromRepository(
        repository,
        tTrendingPage,
      );
      //act
      final result = await usecase(1);
      //assert
      expect(result, Right(tTrendingPage));
    },
  );
}

void _setUpMockTrendingPageFromRepository(
  MockTrendingMovieRepository repository,
  TrendingPage tTrendingPage,
) {
  when(repository.getTrendingMoviePage(any))
      .thenAnswer((_) async => Right(tTrendingPage));
}
