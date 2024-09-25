import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotifyclone/data/model/auth/create_user_request.dart';
import 'package:spotifyclone/data/model/auth/login_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> register(CreateUserRequest createUserRequest);
  Future<Either> login(LoginUserRequest loginUserRequest);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> login(LoginUserRequest loginUserRequest) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginUserRequest.email,
        password: loginUserRequest.password,
      );

      return const Right("Logging In");
    } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == "invalid-email") {
        message = "Email not registered. Create an Account.";
      } else if (e.code == "invalid-credential") {
        message = "Wrong Password. Try resetting password.";
      }

      return Left(message);
    }
  }

  @override
  Future<Either> register(CreateUserRequest createUserRequest) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserRequest.email,
        password: createUserRequest.password,
      );

      FirebaseFirestore.instance.collection("users").add({
        'name': createUserRequest.userName,
        'email': data.user?.email,
      });

      return const Right("Account Created");
    } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == "weak-password") {
        message = "Weak Password";
      } else if (e.code == "email-already-in-use") {
        message = "Account already exists with this email. Try Logging in or Reset Password.";
      }

      return Left(message);
    }
  }

  @override
  Future<User?> checkAuthState() async {
    return FirebaseAuth.instance.currentUser;
  }
}
