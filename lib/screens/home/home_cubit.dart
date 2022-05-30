import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo/screens/goals/goals_screen.dart';
import 'package:my_todo/screens/goals/widgets/add_goal_bottom_sheet.dart';
import 'package:my_todo/screens/home/custom_bottom_sheet.dart';
import 'package:my_todo/screens/home/home_states.dart';
import 'package:my_todo/screens/interests/interrests_screen.dart';
import 'package:my_todo/screens/interests/widgets/add_interest_bottom_sheet.dart';
import 'package:my_todo/screens/tasks/widgets/add_task_bottom_sheet.dart';
import 'package:my_todo/shared/app_repository.dart';

import '../tasks/tasks_screen.dart';

class HomeCubit extends Cubit<HomeStates> {
  final AppRepository _appRepository;

  HomeCubit({required AppRepository appRepository})
      : _appRepository = appRepository,
        super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  ///control bottomNavigationBar

  int currentIndex = 1;

  void changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(BottomNavBarChangeState());
  }

  /// control filter dropdownMenu

  List<String> filterDropdownItems = ['الأهداف', 'الاهتمامات', 'التاريخ'];
  late String? filterDropdownValue = filterDropdownItems[0];

  String? dropDawnValue;

  changeDropDownValue(String? newValue) {
    dropDawnValue = newValue;
    emit(FilterDropdownValueChangeState());
  }

  ///control bottomSheet

  bool addDetailsShown = false;

  void changeBottomSheetDetailsState() {
    addDetailsShown = !addDetailsShown;
    emit(BottomSheetAddDetailsChangeState());
  }

  bool isBottomSheetShown = false;

  void changeBottomSheetState() {
    isBottomSheetShown = !isBottomSheetShown;
    emit(BottomSheetChangeState());
  }

  ///sign out
  bool loadingLogout = false;
  void logout() {

    emit(LogoutLoadingState());

    _appRepository
        .logout()
        .then((value) => emit(LogoutSuccessState()))
        .catchError((error) => emit(LogoutErrorState(error)));
  }
}
