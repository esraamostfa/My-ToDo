import 'package:firebase_auth/firebase_auth.dart';

abstract class UserAuthApi {

  Future<User> registerWithEmail({
    required String name,
    required String email,
    required String password,
  });

  Future<void> createUserRecord({
    required String name,
    required String email,
    required String uId,
    required bool isEmailVerified
});

  Future<User> loginWithEmail({
  required String email,
  required String password,
  });

  Future<void> logout();

  Future<bool> isUserAuthenticated();

  Future<bool> isUserEmailVerified();

  Future<void> verifyEmail();
}