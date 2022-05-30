import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo/shared/themes/theme.dart';
import '../screens/screens.dart';
import 'app_repository.dart';

class MyToDoApp extends StatelessWidget {

  final AppRepository appRepository;

   const MyToDoApp({
     required this.appRepository,
     Key? key
   }) : super(key: key);

  @override  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: appRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeCubit(appRepository: appRepository)),
          BlocProvider(create: (context) => TasksCubit(appRepository: appRepository)..getAllTasks()),
          BlocProvider(create: (context) => LoginCubit(appRepository: appRepository)),
          BlocProvider(create: (context) => RegisterCubit(appRepository: appRepository)),
        ],
        child:
        MaterialApp(
          title: 'My ToDo',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
          home:  FirebaseAuth.instance.currentUser!=null ? HomeLayout() : LoginScreen(),
        ),
      ),
    );
  }
}