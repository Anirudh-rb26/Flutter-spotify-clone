import 'package:dartz/dartz.dart';
import 'package:spotifyclone/data/model/auth/create_user_request.dart';
import 'package:spotifyclone/data/model/auth/login_user_request.dart';

abstract class AuthRepository {
  Future<Either> register(CreateUserRequest createUserRequest);
  Future<Either> login(LoginUserRequest loginUserRequest);
}
