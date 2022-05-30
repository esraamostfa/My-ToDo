import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo/screens/register/register_cubit.dart';
import 'package:my_todo/screens/register/register_states.dart';

import '../../shared/componnents.dart';
import '../home/home_layout.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final nameController = TextEditingController();
    final passwordController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    var cubit = RegisterCubit.get(context);

    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterErrorState) {
          showToast(state.error, ToastStates.error);
        }

        if (state is CreateUserSuccessState) {
          showToast('Registered successfully', ToastStates.success);
          navigateAndFinish(context, HomeLayout());
          // CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
          //   navigateAndFinish(context, HomeLayout());
          // });
        }

        if (state is RegisterLoadingState) {
          cubit.registerLoading = true;
        }
      },
      builder: (context, state) {
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
                        Text(
                          'إنشاء حساب',
                          style: Theme.of(context).textTheme.headline4!,
                        ),
                        // Text(
                        //   'Register now to communicate your friends',
                        //   style:
                        //   Theme.of(context).textTheme.bodyText1!.copyWith(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        const SizedBox(
                          height: 29,
                        ),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                              labelText: 'الاسم',
                              prefixIcon: Icon(Icons.person)),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your name';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
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
                                cubit.userRegister(
                                    nameController.text,
                                    emailController.text,
                                    passwordController.text);
                              }
                            }),
                        const SizedBox(
                          height: 29,
                        ),
                        if (!cubit.registerLoading)
                          MaterialButton(
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userRegister(
                                    nameController.text,
                                    emailController.text,
                                    passwordController.text);
                              }
                            },
                            child: Text(
                              'إنشاء حساب',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                            ),
                          ),
                        if (cubit.registerLoading)
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('already have an account?'),
                            TextButton(
                              onPressed: () {
                                navigateAndFinish(context, LoginScreen());
                              },
                              child: Text('login'.toUpperCase()),
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
      },
    );
  }
}
