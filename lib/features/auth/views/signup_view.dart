import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_router.dart';
import '../../../shared/custom_btn.dart';
import '../../../shared/custom_text.dart';
import '../../../shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password =
      TextEditingController();
  final TextEditingController _confirmPassword =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _email.dispose();
    _name.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Gap(100),
                        CustomText(
                          text: 'Create Account',
                          fontSize: 30,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w800,
                        ),
                        const Gap(60),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(36),
                            decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius:
                                  const BorderRadius.only(
                                    topLeft: Radius.circular(60),
                                    topRight: Radius.circular(
                                      60,
                                    ),
                                  ),
                            ),
                            child: Column(
                              // crossAxisAlignment:
                              //     CrossAxisAlignment.start,
                              children: [
                                const Gap(10),

                                Row(
                                  children: [
                                    const Gap(15),
                                    CustomText(
                                      text: 'Full Name',
                                      fontSize: 15,
                                      color: AppColors.textColor,
                                      fontWeight:
                                          FontWeight.w500,
                                    ),
                                  ],
                                ),
                                const Gap(8),
                                CustomTextFormField(
                                  hintText: 'Mohamed Tamer',
                                  isPassword: false,
                                  controller: _name,
                                ),
                                const Gap(20),
                                Row(
                                  children: [
                                    const Gap(15),
                                    CustomText(
                                      text: 'Email',
                                      fontSize: 15,
                                      color: AppColors.textColor,
                                      fontWeight:
                                          FontWeight.w600,
                                    ),
                                  ],
                                ),
                                const Gap(8),
                                CustomTextFormField(
                                  hintText:
                                      'example@example.com',
                                  isPassword: false,
                                  controller: _email,
                                ),
                                const Gap(20),
                                Row(
                                  children: [
                                    const Gap(15),
                                    CustomText(
                                      text: 'Password',
                                      fontSize: 15,
                                      color: AppColors.textColor,
                                      fontWeight:
                                          FontWeight.w600,
                                    ),
                                  ],
                                ),
                                const Gap(8),
                                CustomTextFormField(
                                  hintText: '* * * * * * * *',
                                  isPassword: true,
                                  controller: _password,
                                ),
                                const Gap(20),
                                Row(
                                  children: [
                                    const Gap(15),
                                    CustomText(
                                      text: 'Confirm Password',
                                      fontSize: 15,
                                      color: AppColors.textColor,
                                      fontWeight:
                                          FontWeight.w600,
                                    ),
                                  ],
                                ),
                                const Gap(8),
                                CustomTextFormField(
                                  hintText: '* * * * * * * *',
                                  isPassword: true,
                                  controller: _confirmPassword,
                                ),
                                const Gap(50),
                                CustomButton(
                                  text: 'Sign Up',
                                  width: 207,
                                  color: AppColors.primary,
                                  textColor: AppColors.textColor,
                                  onTap: () {
                                    if (_formKey.currentState!
                                        .validate()) {
                                      // Perform signup action
                                    }
                                  },
                                ),
                                const Gap(12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    const CustomText(
                                      fontSize: 13,
                                      text:
                                          'Already have an account? ',
                                    ),

                                    GestureDetector(
                                      onTap: () => context
                                          .pushReplacement(
                                            AppRouter.loginView,
                                          ),
                                      child: const CustomText(
                                        color: Colors.blueAccent,
                                        text: 'Log In',
                                        fontSize: 13,
                                      ),
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
        ),
      ),
    );
  }
}
