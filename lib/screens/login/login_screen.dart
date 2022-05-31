import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo/screens/login/loginStates.dart';
import 'package:my_todo/screens/login/login_cubit.dart';

import '../../shared/componnents.dart';
import '../home/home_layout.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    LoginCubit cubit = LoginCubit.get(context);

    return BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
      if (state is LoginErrorState) {
        showToast(state.error, ToastStates.error, context);
      }

      if (state is LoginSuccessState) {
        showToast('Registered successfully', ToastStates.success, context);
        navigateAndFinish(context, HomeLayout());
      }


      if(state is LoginLoadingState) {
        cubit.loginLoading = true;
      }
    }, builder: (context, state) {

      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(21.0),
              child: Form(
                key: formKey,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('تسجيل الدخول',
                          style: Theme.of(context).textTheme.headline4!),
                      // Text(
                      //   'Login now and begin productivity',
                      //   style: Theme.of(context).textTheme.bodyText1!
                      //       .copyWith(
                      //     color: Colors.grey,
                      //   ),
                      // ),
                      const SizedBox(
                        height: 29,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            labelText: 'البريد الإلكتروني',
                            prefixIcon: Icon(Icons.email_outlined)),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your email address';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: 'كلمة السر',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(
                                cubit.isPassShown
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                              onPressed: () {
                                cubit.changePasswordVisibility();
                              },
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'password is too short';
                            } else {
                              return null;
                            }
                          },
                          obscureText: !cubit.isPassShown,
                          onFieldSubmitted: (value) {
                            if (formKey.currentState!.validate()) {
                              cubit.userLogin(emailController.text,
                                  passwordController.text);
                            }
                          }),
                      const SizedBox(
                        height: 29,
                      ),
                      if (!cubit.loginLoading)
                        MaterialButton(
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.userLogin(emailController.text,
                                  passwordController.text);
                            }
                          },
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          ),
                        ),
                      if (cubit.loginLoading)
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('don\'t have an account?'),
                          TextButton(
                            onPressed: () {
                              naveTo(context, RegisterScreen());
                            },
                            child: Text('register now'.toUpperCase()),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
