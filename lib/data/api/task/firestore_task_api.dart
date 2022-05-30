import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_todo/data/api/task/mytodo_api.dart';
import 'package:my_todo/data/models/task.dart';

class FirestoreTaskApi extends MyToDoApi {

  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final User user = FirebaseAuth.instance.currentUser!;

  @override
  Future<String> addTask(Task task) async {
    DocumentReference taskDoc = await fireStore
        .collection('users')
        .doc(user.uid)
    .collection('tasks')
    .add(task.toJson());

    return taskDoc.id;
  }

  @override
  Future<void> archiveTask(String id) {
    // TODO: implement archiveTask
    throw UnimplementedError();
  }

  @override
  Future<void> completeTask(String id, bool isCompleted) async {
    fireStore
        .collection('users')
        .doc(user.uid)
        .collection('tasks')
        .doc(id).update({'isCompleted' : isCompleted});
  }

  @override
  Future<void> deleteTask(String id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAllTasks() async {
    List<Task> tasks = [];
    
     await fireStore.collection('users').doc(user.uid).collection('tasks').get().then((value){

         for (var task in value.docs) {
           tasks.add(Task.fromJson(task.data()));
         }
    });

     return tasks;

  }

  @override
  Future<void> updateTask(Task task) async {
    fireStore
        .collection('users')
        .doc(user.uid)
        .collection('tasks')
        .doc(task.id).update(task.toJson());
  }
}
