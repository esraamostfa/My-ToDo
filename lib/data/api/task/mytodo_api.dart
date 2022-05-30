import 'package:my_todo/data/models/task.dart';

abstract class MyToDoApi {

  ///add new task
  Future<String> addTask(Task task);

  ///update existing task
  Future<void> updateTask(Task task);

  ///delete task with given id
  Future<void> deleteTask(String id);

  ///mark task with given id as completed
  Future<void> completeTask(String id, bool isCompleted);

  ///mark task with given id as archived
  Future<void> archiveTask(String id);

  ///return stream of all tasks
  Future<List<Task>> getAllTasks();
}