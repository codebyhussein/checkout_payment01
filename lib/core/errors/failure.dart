class Failure {
  final String errorMassege;

  Failure({required this.errorMassege});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMassege});
}
