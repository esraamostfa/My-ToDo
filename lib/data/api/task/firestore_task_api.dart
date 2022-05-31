import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_todo/data/api/task/mytodo_api.dart';
import 'package:my_todo/data/models/task.dart';

class FirestoreTaskApi extends MyToDoApi {

  //final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  //final User user = FirebaseAuth.instance.currentUser!;
  final tasksCollection = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('tasks');

  @override
  Future<String> addTask(Task task) async {
    DocumentReference taskDoc = await tasksCollection
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
    tasksCollection
        .doc(id).update({'isCompleted' : isCompleted});
  }

  @override
  Future<void> deleteTask(String id) async {
    tasksCollection.doc(id).delete();
  }

  @override
  Future<List<Task>> getAllTasks() async {
    List<Task> tasks = [];
    
     await tasksCollection.get().then((value){

         for (var task in value.docs) {
           tasks.add(Task.fromJson(task.data()));
         }
    });

     return tasks;

  }

  @override
  Future<void> updateTask(Task task) async {
    tasksCollection
        .doc(task.id).update(task.toJson());
  }

  @override
  Future<Task> getTask(String id) async {
    final taskMap = await tasksCollection.doc(id).get();
    Task task = Task.fromJson(taskMap.data()!);
    return task;
  }
}
