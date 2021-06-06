import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Movie extends Equatable {
  final String title;
  final int id;
  final String posterPath;
  final String overview;
  final bool isAdult;

  Movie({
    @required this.title,
    @required this.id,
    @required this.posterPath,
    @required this.overview,
    this.isAdult = false,
  }): assert(id != null),
  assert(title != null),
  assert(posterPath != null);

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
