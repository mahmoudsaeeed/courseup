sealed class Result {
}

class Success<T> extends Result {
  Success({required this.value});

  final T value;
}

class Failure extends Result {
  Failure({required this.exception});

  final Object exception;
}

class FailureMessage extends Result {

  final String? failureMessage;

  FailureMessage({required this.failureMessage});
}