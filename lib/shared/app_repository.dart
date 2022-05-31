
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import '../data/api/api.dart';
import '../data/models/task.dart';

class AppRepository {

  final UserAuthApi userAuthApi;
  final MyToDoApi myToDoApi;

  AppRepository({
    required this.userAuthApi,
    required this.myToDoApi
});


///Authentication
  Future<User> registerWithEmail({
    required String name,
    required String email,
    required String password,
  }) => userAuthApi.registerWithEmail(name: name, email: email, password: password);

  Future<void> createUserRecord({required String name, required String email, required String uId, required bool isEmailVerified})
  => userAuthApi.createUserRecord(name: name, email: email, uId: uId, isEmailVerified: isEmailVerified);

  Future<User> loginWithEmail({
    required String email,
    required String password,
  }) => userAuthApi.loginWithEmail(email: email, password: password);

  Future<void> logout() => userAuthApi.logout();

  Future<bool> isUserAuthenticated() => userAuthApi.isUserAuthenticated();

  Future<bool> isUserEmailVerified() => userAuthApi.isUserEmailVerified();

  Future<void> verifyEmail() => userAuthApi.verifyEmail();


 ///control tasks

  ///add new task
  Future<String> addTask(Task task) => myToDoApi.addTask(task);

  ///update existing task
  Future<void> updateTask(Task task) => myToDoApi.updateTask(task);

  ///delete task with given id
  Future<void> deleteTask(String id) => myToDoApi.deleteTask(id);

  ///mark task with given id as completed
  Future<void> completeTask(String id, bool isCompleted) => myToDoApi.completeTask(id, isCompleted);

  ///mark task with given id as archived
  Future<void> archiveTask(String id) => myToDoApi.archiveTask(id);

  ///return future list of all tasks
  Future<List<Task>> getAllTasks() => myToDoApi.getAllTasks();

  ///get task by id
Future<Task> getTask(String id) => myToDoApi.getTask(id);

}
