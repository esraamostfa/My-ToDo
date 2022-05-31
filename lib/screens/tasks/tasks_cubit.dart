import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo/screens/tasks/tasks_states.dart';
import 'package:my_todo/shared/app_repository.dart';

import '../../data/models/task.dart';

class TasksCubit extends Cubit<TasksState> {
  AppRepository _appRepository;

  TasksCubit({required AppRepository appRepository})
      : _appRepository = appRepository,
        super(TasksInitialState());

  static TasksCubit get(context) => BlocProvider.of(context);

  ///add new task

  void addTask(
      {required String title, String? details, String? date, String? time}) {
    emit(TaskLoadAddState());

    Task task =
        Task(id: '', title: title, details: details, date: date, time: time);
    print('task title: ${task.title}');
    _appRepository.addTask(task).then((value) {
      _appRepository.updateTask(task.copyWith(id: value));
      emit(TaskSuccessfullyAddedState());
      getAllTasks();
    }).catchError((error) => emit(TaskErrorAddState()));
  }

  ///get all tasks
  List<Task> tasks = [];

  void getAllTasks() {
    emit(TaskLoadGetState());

    _appRepository.getAllTasks().then((value) {
      tasks = value;
      print("tasks: $tasks");
      emit(TaskSuccessfullyGetState());
    }).catchError((error) => emit(TaskErrorGetState()));
  }

  ///complete | unComplete task

  void completeTask(int index, String id, bool isCompleted) {
    tasks[index].isCompleted = isCompleted;
    _appRepository
        .completeTask(id, isCompleted)
        .then((value) => emit(TaskCompletedState()));
  }

  ///delete task
  bool undoDelete = false;
  String? deletedTaskId;

  void deleteTask(int index, String id) {
    emit(TaskLoadDeletedState());

    deletedTaskId = id;

    tasks.removeAt(index);

    Future.delayed(const Duration(milliseconds: 5000), () {
      if (!undoDelete) {
        _appRepository.deleteTask(id).then((value) {
          emit(TaskSuccessfullyDeletedState());
        }).catchError((error) => emit(TaskErrorDeletedState()));
      }
      undoDelete = false;
    });
  }

  void undoDeleteTask() {
    undoDelete = true;
    _appRepository.getTask(deletedTaskId!).then((value) {
      tasks.add(value);
      getAllTasks();
    });
  }
}
