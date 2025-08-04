import 'package:flutter/material.dart';
import 'package:market_app/core/app_colors.dart';

import '../../../core/widget/build_material_button.dart';
import '../../../core/widget/build_text_form_field.dart';

class ForgetView extends StatelessWidget {
  ForgetView({super.key});

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    const SizedBox(height: 15),
                    buildMaterialButton(
                      text: 'Send',
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
