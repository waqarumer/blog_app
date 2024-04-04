import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository{
    final AuthRemoteDataSource remoteDataSource;
    const AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
     required String password,
     }) {
  
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signupWithEmailPassword({
    required String name,
     required String email,
      required String password,
      }) async {
    try {
      final user = await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password
        );
        return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

}