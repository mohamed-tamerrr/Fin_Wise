import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/core/utils/app_router.dart';
import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/features/profile/data/models/profile_menu_item.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const List<ProfileMenuItem> menuItems = [
    ProfileMenuItem(
      title: 'Edit Profile',
      image: 'assets/profile/edit.png',
      path: AppRouter.editProfileView,
    ),
    ProfileMenuItem(
      title: 'Security',
      image: 'assets/profile/security.png',
      path: AppRouter.securityProfileView,
    ),
    ProfileMenuItem(
      title: 'Setting',
      image: 'assets/profile/settings.png',
      path: AppRouter.settingsProfileView,
    ),

    ProfileMenuItem(
      title: 'Help',
      image: 'assets/profile/help.png',
      path: AppRouter.helpProfileView,
    ),
    ProfileMenuItem(
      title: 'Logout',
      image: 'assets/profile/logout.png',
      path: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primary,
      child: SafeArea(
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
                      CustomText(
                        text: 'Profile',
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
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(60.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        Gap(70.h),
                        CustomText(
                          text: 'John Smith',
                          style: AppStyles.bold20,
                        ),
                        Gap(40.h),
                        Expanded(
                          child: ListView.separated(
                            physics:
                                const NeverScrollableScrollPhysics(),
                            itemCount: menuItems.length,
                            itemBuilder: (context, index) {
                              final item = menuItems[index];
                              return ListTile(
                                onTap: () {
                                  if (item.path != null) {
                                    context.push(item.path!);
                                  } else {
                                    // Handle logout action
                                  }
                                },
                                leading: Image.asset(
                                  item.image,
                                  width: 57.w,
                                  height: 53.h,
                                ),
                                title: CustomText(
                                  text: item.title,
                                  style: AppStyles.medium15
                                      .copyWith(
                                        color: AppColors
                                            .lettersandIcons,
                                      ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Gap(30.h);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 85.h,
              child: Image.asset(
                'assets/profile/profile.png',
                width: 150.w,
                height: 150.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
