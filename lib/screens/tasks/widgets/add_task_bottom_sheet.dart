import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:my_todo/screens/home/custom_bottom_sheet.dart';

import '../tasks_cubit.dart';

class AddTaskBottomSheet extends CustomBottomSheet {

  @override
  var titleController = TextEditingController();
  var detailsController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget buildForm({required context, required GlobalKey<FormState> formKey}) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: titleController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                labelText: 'Task Title',
                prefixIcon: Icon(Icons.title),
                //suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
                border: OutlineInputBorder()),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Title can\'t be empty';
              }
              return null;
            },
            onFieldSubmitted: (_){
              print('title on submit: ${titleController.text}');
              //saveTask(TasksCubit.get(context), formKey);
            },
          ),
          //if (cubit.addDetailsShown)
          TextFormField(
            controller: detailsController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                labelText: 'Task details',
                prefixIcon: Icon(Icons.menu_rounded),
                //suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
                border: OutlineInputBorder()),
          ),

          if(dateController.text.isNotEmpty)
            InputChip(label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(dateController.text),
                Text(timeController.text),
              ],
            )),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    //cubit.changeBottomSheetDetailsState();
                  },
                  icon: const Icon(Icons.menu_rounded)),
              const SizedBox(
                width: 9,
              ),
              IconButton(
                  onPressed: () {
                    showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now())
                        .then((value) {
                      timeController.text =
                          value!.format(context);

                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.parse(
                              '2022-07-31'))
                          .then((value) {
                        dateController.text =
                            DateFormat.yMMMd()
                                .format(value!);
                      });
                    });
                  },
                  icon: const Icon(
                      Icons.watch_later_outlined)),
              const SizedBox(
                width: 9,
              ),
              IconButton(
                  onPressed: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.parse(
                            '2022-07-31'))
                        .then((value) {
                      dateController.text =
                          DateFormat.yMMMd()
                              .format(value!);
                    });
                  },
                  icon: const Icon(
                      Icons.calendar_today_rounded)),
              const Spacer(),
              MaterialButton(onPressed: (){
                //saveTask(TasksCubit.get(context), formKey);
                Navigator.pop(context);
              },
                  child: Text('الغاء', style: TextStyle(color: Theme.of(context).colorScheme.primary),)),

            ],
          )
        ],
      ),
    );
  }

  @override
  save({required cubit, required GlobalKey<FormState> formKey, required context}) {
    if (formKey.currentState!.validate()) {
      cubit.addTask(
          title: titleController.text,
          details: detailsController.text,
          date: dateController.text,
          time: timeController.text);

      Navigator.pop(context);
    }
  }

}