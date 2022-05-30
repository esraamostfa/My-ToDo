import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo/screens/tasks/tasks_cubit.dart';
import 'package:my_todo/screens/tasks/tasks_states.dart';

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
                  return Row(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: cubit.tasks[index].isCompleted,
                              shape: const CircleBorder(),
                              onChanged: (value){
                                cubit.completeTask(index, cubit.tasks[index].id, !cubit.tasks[index].isCompleted);
                              }),
                          Text(cubit.tasks[index].title,),
                        ],
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 5.0,),
                itemCount: cubit.tasks.length),
          );
        }, );
  }
}
