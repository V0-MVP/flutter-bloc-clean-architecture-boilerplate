import 'package:bloc_clean_architecture/src/comman/failure.dart';
import 'package:bloc_clean_architecture/src/domain/repositories/autentication_repository.dart';
import 'package:dartz/dartz.dart';

class SignIn {
  SignIn(this._repository);
  final AuthenticationRepository _repository;

  Future<Either<Failure, void>> execute(String email, String password) async {
    return await _repository.login(email, password);
  }
}
