
import 'package:fruit_hup/core/services/firebase_auth_service.dart';
import 'package:fruit_hup/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:fruit_hup/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
  
 ) );
   

}