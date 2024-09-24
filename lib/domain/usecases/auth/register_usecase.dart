import 'package:dartz/dartz.dart';
import 'package:spotifyclone/core/usecases/usecase.dart';
import 'package:spotifyclone/data/model/auth/create_user_request.dart';
import 'package:spotifyclone/domain/repositories/auth/auth_repository.dart';
import 'package:spotifyclone/service_locator.dart';

class RegisterUsecase implements Usecase<Either, CreateUserRequest> {
  @override
  Future<Either> call({CreateUserRequest? params}) async {
    return serviceLocator<AuthRepository>().register(params!);
  }
}
