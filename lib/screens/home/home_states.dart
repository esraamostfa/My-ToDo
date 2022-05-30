abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class BottomNavBarChangeState extends HomeStates {}
class BottomSheetChangeState extends HomeStates {}
class BottomSheetAddDetailsChangeState extends HomeStates {}
class FilterDropdownValueChangeState extends HomeStates {}

class LogoutLoadingState extends HomeStates {}
class LogoutSuccessState extends HomeStates {}
class LogoutErrorState extends HomeStates {
  final String error;
  LogoutErrorState(this.error);
}