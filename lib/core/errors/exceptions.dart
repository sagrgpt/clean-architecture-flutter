class ServerException implements Exception {
  final String message;

  ServerException(
    this.message,
  ) : assert(message != null);

  factory ServerException.withoutMessage() => ServerException('');
}

class CacheException implements Exception {
  final String message;

  CacheException(
    this.message,
  ) : assert(message != null);

  factory CacheException.withoutMessage() => CacheException('');
}
