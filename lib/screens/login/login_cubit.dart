import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo/shared/app_repository.dart';
import 'loginStates.dart';

class LoginCubit extends Cubit<LoginStates> {

  final AppRepository _appRepository;

  LoginCubit({required AppRepository appRepository}) : _appRepository = appRepository, super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin(String email, String password) {
    emit(LoginLoadingState());
    _appRepository.loginWithEmail(email: email, password: password)
        .then((value) {
      emit(LoginSuccessState(value.uid));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

  bool isPassShown = false;

  void changePasswordVisibility() {
    isPassShown = !isPassShown;
    emit(LoginPassVisibilityState());
  }

  bool loginLoading = false;

}
