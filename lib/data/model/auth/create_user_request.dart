class CreateUserRequest {
  final String userName;
  final String email;
  final String password;

  CreateUserRequest({
    required this.userName,
    required this.email,
    required this.password,
  });
}
