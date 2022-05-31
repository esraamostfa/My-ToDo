import 'package:my_todo/screens/screens.dart';

abstract class TasksState {}

class TasksInitialState extends TasksState {}

class TaskSuccessfullyAddedState extends TasksState {}
class TaskErrorAddState extends TasksState {}
class TaskLoadAddState extends TasksState {}

class TaskSuccessfullyGetState extends TasksState {}
class TaskErrorGetState extends TasksState {}
class TaskLoadGetState extends TasksState {}

class TaskCompletedState extends TasksState {}

class TaskSuccessfullyDeletedState extends TasksState {}
class TaskErrorDeletedState extends TasksState {}
class TaskLoadDeletedState extends TasksState {}
