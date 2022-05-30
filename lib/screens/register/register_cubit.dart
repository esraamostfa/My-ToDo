import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo/screens/register/register_states.dart';
import '../../shared/app_repository.dart';



class RegisterCubit extends Cubit<RegisterStates> {

  final AppRepository _appRepository;

  RegisterCubit({required AppRepository appRepository}) : _appRepository = appRepository, super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister(
      String name,
      String email,
      String password,) {
    emit(RegisterLoadingState());

    _appRepository.registerWithEmail(name: name, email: email, password: password)
        .then((value){
      createUser(name, email, value.uid, value.emailVerified);
      emit(RegisterSuccessState());
    }).catchError((error){
      emit(RegisterErrorState(error.toString()));
    });
  }

  bool registerLoading = false;

  void createUser(String name, String email, String uId, bool isEmailVerified) {
    emit(RegisterLoadingState());
    _appRepository.createUserRecord(name: name, email: email, uId: uId, isEmailVerified: isEmailVerified)
.then((value){
      emit(CreateUserSuccessState(uId));
    }).catchError((error){
      emit(CreateUserErrorState(error.toString()));
    });
  }

  bool isPassShown = false;

  void changePasswordVisibility() {
    isPassShown = !isPassShown;
    emit(RegisterPassVisibilityState());
  }

}