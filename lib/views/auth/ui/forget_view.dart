import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/app_colors.dart';
import 'package:market_app/views/auth/logic/cubit.dart';
import 'package:market_app/views/auth/logic/states.dart';

import '../../../core/widget/build_material_button.dart';
import '../../../core/widget/build_text_form_field.dart';

class ForgetView extends StatelessWidget {
  ForgetView({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppAuthCubit, AppAuthStates>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Reset Password Email Sent!')),
          );
          Navigator.pushReplacementNamed(context, '/login');
        } else if (state is ResetPasswordError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        final cubit = AppAuthCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Enter Your Email Address To Reset Your Password',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                        buildTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: passwordController,
                          label: 'NewPassword',
                        ),
                        const SizedBox(height: 15),
                        buildMaterialButton(
                          text: 'Send',
                          onTap: () {
                            cubit.resetPassword(emailController.text);
                          },
                        ),
                        buildMaterialButton(
                          text: 'Change',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
