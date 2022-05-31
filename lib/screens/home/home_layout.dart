

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo/screens/home/home_cubit.dart';
import 'package:my_todo/screens/home/home_states.dart';
import 'package:my_todo/screens/login/login_screen.dart';
import 'package:my_todo/screens/tasks/tasks_cubit.dart';

import '../../shared/componnents.dart';
import '../goals/goals_screen.dart';
import '../goals/widgets/add_goal_bottom_sheet.dart';
import '../interests/interrests_screen.dart';
import '../interests/widgets/add_interest_bottom_sheet.dart';
import '../tasks/tasks_screen.dart';
import '../tasks/widgets/add_task_bottom_sheet.dart';
import 'custom_bottom_sheet.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  //final titleController = TextEditingController();
  //final detailsController = TextEditingController();
  //final timeController = TextEditingController();
  //final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    HomeCubit cubit = BlocProvider.of(context);

    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if(state is LogoutSuccessState)
            {
              showToast('logged out successfully', ToastStates.success, context);
              navigateAndFinish(context, LoginScreen());
            }
          if(state is LogoutErrorState) {
            showToast(state.error, ToastStates.error, context);
          }

          if(state is LogoutLoadingState) cubit.loadingLogout = true;
        },
        builder: (context, state) {

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(titles[cubit.currentIndex]),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list_rounded)),
                // DropdownButtonHideUnderline(
                //   child: DropdownButton(
                //     hint: const Text('select'),
                //     icon: const Icon(Icons.filter_list_rounded),
                //     value: cubit.filterDropdownValue,
                //       items: cubit.filterDropdownItems.map((String item) => DropdownMenuItem(
                //           value: item,
                //           child: Row(
                //             children: [
                //               Text(item),
                //             ],
                //           )
                //       )
                //       ).toList(),
                //       onChanged: (String? value) {
                //
                //       },
                //   ),
                // ),

                //if(!cubit.loadingLogout)
                IconButton(
                    onPressed: () => cubit.logout(),
                    icon: const Icon(Icons.exit_to_app)
                ),
                //if(cubit.loadingLogout)
                  //const CircularProgressIndicator()
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: bottomNavItems,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavIndex(index);
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                TasksCubit tasksCubit = TasksCubit.get(context);
                final bottomSheetForm = buildBottomSheetForm(cubit.currentIndex);

                if (cubit.isBottomSheetShown) {
                  bottomSheetForm.save(cubit: tasksCubit, formKey: formKey, context: context);

                } else {
                  cubit.changeBottomSheetState();

                  scaffoldKey.currentState
                      ?.showBottomSheet(
                        (context) => Container(
                          margin: const EdgeInsets.all(25),
                          child: bottomSheetForm.buildForm(context: context, formKey: formKey)
                        ),
                        elevation: 21,
                      )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState();
                  });
                }
              },
              child: cubit.isBottomSheetShown
                  ? const Icon(Icons.save)
                  : const Icon(Icons.add),
            ),
            body: screens[cubit.currentIndex],
          );
        });
  }

  List<Widget> screens = [
    const GoalsScreen(),
    const TasksScreen(),
    const InterestsScreen(),
  ];

  List<String> titles = ['أهدافي', 'مهامي', 'اهتمامتي'];

  late List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.flag_outlined),
      label: titles[0],),
    BottomNavigationBarItem(
      icon: const Icon(Icons.task_outlined),
      label: titles[1],),
    BottomNavigationBarItem(
      icon: const Icon(Icons.category_outlined),
      label: titles[2],),
  ];


  List<CustomBottomSheet> bottomSheetForms = [AddInterestBottomSheet(), AddTaskBottomSheet(), AddGoalBottomSheet()];

  //factory method
  CustomBottomSheet buildBottomSheetForm(int index,) {
    CustomBottomSheet selectedBottomSheet = bottomSheetForms[index];

    return selectedBottomSheet;
  }

}
