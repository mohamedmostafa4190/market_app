import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/app_colors.dart';
import 'package:market_app/views/auth/logic/cubit.dart';
import '../../../core/widget/build_material_button.dart';
import '../../../core/widget/build_text_button.dart';
import '../../../core/widget/build_text_form_field.dart';
import '../logic/states.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppAuthCubit, AppAuthStates>(
      listener: (context, state) {
        if (state is RegisterScreenSuccess || state is LoginWithGoogleSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration Successful!')),
          );
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state is RegisterScreenError ||
            state is LoginWithGoogleError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error To Login'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final cubit = AppAuthCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
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
                              keyboardType: TextInputType.text,
                              controller: nameController,
                              label: 'Name',
                            ),
                            const SizedBox(height: 15),
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
                              children: [
                                const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                if (state is! RegisterScreenLoading)
                                  buildMaterialButton(
                                    icon: Icons.arrow_forward,
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        cubit.register(
                                          name: nameController.text,
                                          email: emailController.text,
                                          password: passController.text,
                                        );
                                      }
                                    },
                                  )
                                else
                                  CircularProgressIndicator(),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const Text(
                                  'Sign up With Google',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                if (state is! LoginWithGoogleLoading)
                                  buildMaterialButton(
                                    icon: Icons.arrow_forward,
                                    onTap: () {
                                      cubit.googleSignIn();
                                    },
                                  )
                                else
                                  CircularProgressIndicator(),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already Have An Account?',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                buildTextButton(
                                  text: 'Login',
                                  onTap: () {
                                    Navigator.pushNamed(context, '/login');
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
