import 'package:dartz/dartz.dart';
import 'package:spotifyclone/data/model/auth/create_user_request.dart';
import 'package:spotifyclone/data/model/auth/login_user_request.dart';
import 'package:spotifyclone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotifyclone/domain/repositories/auth/auth_repository.dart';
import 'package:spotifyclone/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> login(LoginUserRequest loginUserRequest) async {
    return await serviceLocator<AuthFirebaseService>().login(loginUserRequest);
  }

  @override
  Future<Either> register(CreateUserRequest createUserRequest) async {
    return await serviceLocator<AuthFirebaseService>().register(createUserRequest);
  }
}
