import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_todo/data/api/user_auth/user_auth_api.dart';

import '../../models/user.dart';

class FireBaseUserAuthApi extends UserAuthApi {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User> registerWithEmail({
    required String name,
    required String email,
    required String password,}) async{
    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password);

    return userCredential.user!;
  }

  @override
  Future<void> createUserRecord({
    required String name,
    required String email,
    required String uId,
    required bool isEmailVerified}) async {

    UserModel user = UserModel(
        name: name,
        email: email,
        isEmailVerified: isEmailVerified,
        uId: uId
    );

    FirebaseFirestore.instance.collection('users').doc(uId).set(user.toJson());
  }

  @override
  Future<User> loginWithEmail({
    required String email,
    required String password}) async {
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password);

    return userCredential.user!;
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<bool> isUserAuthenticated() async {

    bool isUserAuthenticated = false;

    firebaseAuth
        .authStateChanges()
        .listen((User? user) {
      if (user != null) {
        isUserAuthenticated = true;
      }
    });
    return isUserAuthenticated;
  }

  @override
  Future<bool> isUserEmailVerified() {
    // TODO: implement isUserEmailVerified
    throw UnimplementedError();
  }


  @override
  Future<void> verifyEmail() {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }


}