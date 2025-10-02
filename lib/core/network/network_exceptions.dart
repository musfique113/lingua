class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}

class NotFoundException extends NetworkException {
  NotFoundException(super.message);
}

class BadRequestException extends NetworkException {
  BadRequestException(super.message);
}

class UnauthorizedException extends NetworkException {
  UnauthorizedException(super.message);
}

class InternalServerErrorException extends NetworkException {
  InternalServerErrorException(super.message);
}
