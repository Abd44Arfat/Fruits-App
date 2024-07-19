import 'package:dartz/dartz.dart';
import 'package:fruit_hup/core/errors/failure.dart';
import 'package:fruit_hup/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);

  Future<Either<Failure, UserEntity>> signinUserWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, UserEntity>> signinUserWithGoogle();
           Future<Either<Failure, UserEntity>> signinUserWithFacebook(
       );
            Future<Either<Failure, UserEntity>> signinUserWithApple(
       );
}
