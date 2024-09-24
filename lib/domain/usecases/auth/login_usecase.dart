import 'package:dartz/dartz.dart';
import 'package:spotifyclone/core/usecases/usecase.dart';
import 'package:spotifyclone/data/model/auth/login_user_request.dart';
import 'package:spotifyclone/domain/repositories/auth/auth_repository.dart';
import 'package:spotifyclone/service_locator.dart';

class LoginUsecase implements Usecase<Either, LoginUserRequest> {
  @override
  Future<Either> call({LoginUserRequest? params}) async {
    return serviceLocator<AuthRepository>().login(params!);
  }
}
