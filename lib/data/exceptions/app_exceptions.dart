class AppExceptions implements Exception {
  final _prefix;
  final _message;

  AppExceptions([this._prefix, this._message]);

  String toString() {
    return '$_prefix $_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super('InternetException: ', message);
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? message])
      : super('RequestTimeOutException', message);
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super('ServerException: ', message);
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super('FetchDataException: ', message);
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message])
      : super('InvalidUrlException: ', message);
}
