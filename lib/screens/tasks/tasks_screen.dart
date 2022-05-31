import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo/screens/tasks/tasks_cubit.dart';
import 'package:my_todo/screens/tasks/tasks_states.dart';
import 'package:my_todo/shared/componnents.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TasksCubit cubit = BlocProvider.of(context);

    return BlocConsumer<TasksCubit, TasksState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.separated(
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: cubit.tasks[index].isCompleted,
                              shape: const CircleBorder(),
                              onChanged: (value){
                                cubit.completeTask(index, cubit.tasks[index].id, !cubit.tasks[index].isCompleted);
                              }),
                          Text(
                            cubit.tasks[index].title,
                            style: Theme.of(context).textTheme.headline4?.copyWith(decoration: cubit.tasks[index].isCompleted ? TextDecoration.lineThrough : TextDecoration.none),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                cubit.deleteTask(index, cubit.tasks[index].id);

                                showToast('task deleted', ToastStates.warning, context,
                                actionWidget: IconButton(onPressed: (){
                                  cubit.undoDeleteTask();
                                }, icon: const Icon(Icons.undo_rounded)));
                              },
                              icon: Icon(Icons.delete_outline_rounded, color:  Theme.of(context).colorScheme.secondaryContainer,))
                        ],
                      ),
                      if(cubit.tasks[index].time != null && cubit.tasks[index].time != '')
                      Chip(label: Text(cubit.tasks[index].time?? ''))
                    ],
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: cubit.tasks.length),
          );
        }, );
  }
}
