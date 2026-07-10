import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../shared/custom_btn.dart';
import '../../../shared/custom_text.dart';
import '../../../shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() =>
      _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController =
      TextEditingController(text: 'John Smith');
  final TextEditingController _phoneController =
      TextEditingController(text: '+44 555 5555 55');
  final TextEditingController _emailController =
      TextEditingController(text: 'example@example.com');

  bool _pushNotifications = true;
  bool _darkTheme = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                Gap(30.h),

                /// App Bar
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => context.pop(),
                        child: Icon(
                          Iconsax.arrow_left_2,
                          size: 24.sp,
                          color: AppColors.backgroundColor,
                        ),
                      ),
                      CustomText(
                        text: 'Edit My Profile',
                        style: AppStyles.semiBold20,
                      ),
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(
                            alpha: .2,
                          ),
                        ),
                        child: Icon(
                          Icons.notifications,
                          size: 24.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(100.h),

                /// Body
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(60.r),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Gap(70.h),
                            CustomText(
                              text: 'John Smith',
                              style: AppStyles.bold20.copyWith(
                                color: AppColors.lettersandIcons,
                              ),
                            ),

                            Gap(24.h),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CustomText(
                                text: 'Account Settings',
                                style: AppStyles.bold20.copyWith(
                                  color:
                                      AppColors.lettersandIcons,
                                ),
                              ),
                            ),
                            Gap(20.h),

                            const _FieldLabel(label: 'Username'),
                            Gap(8.h),
                            CustomTextFormField(
                              hintText: 'John Smith',
                              isPassword: false,
                              controller: _usernameController,
                            ),
                            Gap(20.h),

                            const _FieldLabel(label: 'Phone'),
                            Gap(8.h),
                            CustomTextFormField(
                              hintText: '+44 555 5555 55',
                              isPassword: false,
                              controller: _phoneController,
                            ),
                            Gap(20.h),

                            const _FieldLabel(
                              label: 'Email Address',
                            ),
                            Gap(8.h),
                            CustomTextFormField(
                              hintText: 'example@example.com',
                              isPassword: false,
                              controller: _emailController,
                            ),
                            Gap(20.h),

                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'Push Notifications',
                                  style: AppStyles.medium15
                                      .copyWith(
                                        color: AppColors
                                            .lettersandIcons,
                                      ),
                                ),
                                Switch(
                                  value: _pushNotifications,
                                  activeThumbColor:
                                      AppColors.primary,
                                  onChanged: (value) {
                                    setState(() {
                                      _pushNotifications = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'Turn Dark Theme',
                                  style: AppStyles.medium15
                                      .copyWith(
                                        color: AppColors
                                            .lettersandIcons,
                                      ),
                                ),
                                Switch(
                                  value: _darkTheme,
                                  activeThumbColor:
                                      AppColors.primary,

                                  onChanged: (value) {
                                    setState(() {
                                      _darkTheme = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Gap(24.h),

                            CustomButton(
                              text: 'Update Profile',
                              width: double.infinity,
                              onTap: () {
                                if (_formKey.currentState!
                                    .validate()) {}
                              },
                              textColor: Colors.white,
                              textStyle: AppStyles.semiBold20
                                  .copyWith(color: Colors.white),
                            ),

                            Gap(20.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// Avatar with camera badge
            Positioned(
              top: 85.h,
              child: Stack(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/profile/profile.png',
                      width: 130.w,
                      height: 130.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Iconsax.camera,
                        size: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: CustomText(
        text: label,
        style: AppStyles.medium15.copyWith(
          color: AppColors.lettersandIcons,
        ),
      ),
    );
  }
}
