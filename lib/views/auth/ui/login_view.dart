import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/app_colors.dart';
import 'package:market_app/views/auth/logic/cubit.dart';
import 'package:market_app/views/auth/logic/states.dart';
import '../../../core/widget/build_material_button.dart';
import '../../../core/widget/build_text_button.dart';
import '../../../core/widget/build_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();

  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppAuthCubit, AppAuthStates>(
      listener: (context, state) {
        if (state is LoginScreenSuccess || state is LoginWithGoogleSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Login Successful!')));
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state is LoginScreenError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        final cubit = AppAuthCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome To Market',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Card(
                      margin: const EdgeInsets.all(24),
                      color: AppColors.kWhiteColor,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildTextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              label: 'Email Address',
                            ),
                            const SizedBox(height: 15),
                            buildTextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: passController,
                              label: 'Password',
                              obscureText: cubit.isPasswordVisible,
                              suffixIcon:
                                  cubit.isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                              suffixTap: () {
                                cubit.passwordVisibility();
                              },
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                buildTextButton(
                                  text: 'Forget Password',
                                  onTap: () {
                                    Navigator.pushNamed(context, '/reset-password');
                                  },
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                ConditionalBuilder(
                                  condition: state is! LoginScreenLoading,
                                  builder:
                                      (context) => buildMaterialButton(
                                        icon: Icons.arrow_forward,
                                        onTap: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            cubit.login(
                                              email: emailController.text,
                                              password: passController.text,
                                            );
                                          }
                                        },
                                      ),
                                  fallback:
                                      (context) => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const Text(
                                  'Login With Google',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                ConditionalBuilder(
                                  condition: state is! LoginWithGoogleLoading,
                                  fallback:
                                      (context) => CircularProgressIndicator(),
                                  builder:
                                      (context) => buildMaterialButton(
                                        icon: Icons.arrow_forward,
                                        onTap: () {
                                          cubit.googleSignIn();
                                        },
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t Have An Account?',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                buildTextButton(
                                  text: 'Sign Up',
                                  onTap: () {
                                    Navigator.pushNamed(context, '/register');
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
