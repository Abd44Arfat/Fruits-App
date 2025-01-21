import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruit_hup/core/errors/exception.dart';
import 'package:fruit_hup/core/errors/failure.dart';
import 'package:fruit_hup/core/services/database_service.dart';
import 'package:fruit_hup/core/services/firebase_auth_service.dart';
import 'package:fruit_hup/core/utils/backend_endpoint.dart';
import 'package:fruit_hup/features/auth/data/models/user_model.dart';
import 'package:fruit_hup/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hup/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {

        User? user;
    try {
       user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);

      var userEntity = UserEntity(name: name, email: email, uId: user.uid);

      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {


deleteUser(user);


      return left(ServerFailure(e.message));
    } catch (e) {
deleteUser(user);

      log('Exception in createUserWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }

 Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }


  @override
  Future<Either<Failure, UserEntity>> signinUserWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);

var userEntity=await getUserData(uid: user.uid);

      return right(
    userEntity
      );
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinUserWithGoogle() async {
    User? user;
    try {


  
  
       user = await firebaseAuthService.signInWithGoogle();
  var userEntity = UserModel.fromFirebaseUser(user); 
var isUserExist =await databaseService.checkIfDataExists(path: BackendEndpoint.isUserExist,docuementId: user.uid);
      if (isUserExist) {
await getUserData(uid: user.uid);

}else{
  await addUserData(user: userEntity);

}
      return right(userEntity);
    } catch (e) {

      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinUserWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
     var userEntity = UserModel.fromFirebaseUser(user); 
var isUserExist =await databaseService.checkIfDataExists(path: BackendEndpoint.isUserExist,docuementId: user.uid);
      if (isUserExist) {
await getUserData(uid: user.uid);

}else{
  await addUserData(user: userEntity);

}

      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {


    await databaseService.addData(
        path: BackendEndpoint.addUserData, data: user.toMap(),
        documentId: user.uId,
        
        );
        
  }
  
  @override
  Future<UserEntity> getUserData({required String uid})async {

var userData=await databaseService.getData(path: BackendEndpoint.getUserData,docuementId: uid);
return UserModel.fromJson(userData);
  }
}

