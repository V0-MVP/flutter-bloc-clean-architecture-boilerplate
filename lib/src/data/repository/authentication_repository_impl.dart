import 'dart:io';
import 'package:bloc_clean_architecture/src/comman/exception.dart';
import 'package:bloc_clean_architecture/src/comman/failure.dart';
import 'package:bloc_clean_architecture/src/data/datasource/authentication_remote_data_source.dart';
import 'package:bloc_clean_architecture/src/domain/repositories/autentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl(this.dataSource);
  final AuthenticationRemoteDataSource dataSource;
  @override
  Future<Either<Failure, void>> login(
    String email,
    String password,
  ) async {
    try {
      final result = await dataSource.login(email, password);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure('No internet connection'),
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          e.response?.data['message'].toString() ??
              'Error occured Please try again',
        ),
      );
    }
  }
}
