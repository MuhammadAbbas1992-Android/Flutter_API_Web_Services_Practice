class AppExceptions implements Exception {
  final _prefix;
  final _message;

  AppExceptions([this._prefix, this._message]);

  String toString() {
    return '$_prefix $_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super('No internet', message);
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? message])
      : super('Request Time Out', message);
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super('Internal Server Error', message);
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super('Error while Communication', message);
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super('Invalid Url', message);
}
