import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/core/utils/app_router.dart';
import 'package:fin_wise/shared/custom_btn.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:fin_wise/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
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
                          text: 'Welcome',
                          fontSize: 30,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w800,
                        ),
                        const Gap(60),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(36),
                            decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60),
                              ),
                            ),
                            child: Column(
                              // crossAxisAlignment:
                              //     CrossAxisAlignment.start,
                              children: [
                                const Gap(90),

                                Row(
                                  children: [
                                    Gap(15),
                                    CustomText(
                                      text: 'Username or email',
                                      fontSize: 15,
                                      color: AppColors.textColor,
                                      fontWeight:
                                          FontWeight.w500,
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
                                const Gap(90),
                                CustomButton(
                                  text: 'Log In',
                                  width: 207,
                                  color: AppColors.primary,
                                  textColor: AppColors.textColor,
                                  onTap: () {
                                    if (_formKey.currentState!
                                        .validate()) {
                                      // Perform login action
                                    }
                                    context.push(
                                      AppRouter.kHomeView,
                                    );
                                  },
                                ),
                                const Gap(20),
                                CustomText(
                                  text: 'Forgot Password?',
                                ),
                                const Gap(14),
                                CustomButton(
                                  text: 'Sign Up',
                                  width: 207,
                                  color: AppColors.secondary,
                                  textColor: AppColors.textColor,
                                  onTap: () {
                                    context.push(
                                      AppRouter.signupView,
                                    );
                                  },
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
