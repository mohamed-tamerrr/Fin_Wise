import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/shared/custom_app_bar.dart';
import 'package:fin_wise/shared/custom_btn.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:fin_wise/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddExpenseView extends StatefulWidget {
  const AddExpenseView({super.key});

  @override
  State<AddExpenseView> createState() => _AddExpenseViewState();
}

class _AddExpenseViewState extends State<AddExpenseView> {
  final amountController = TextEditingController();
  final titleController = TextEditingController();
  final noteController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: AppColors.primary,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                CustomAppBar(
                  expandedHeight: 120.h,
                  topRow: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 24.sp,
                        ),
                      ),

                      CustomText(
                        text: 'Add Expenses',
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

                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 36.w,
                      right: 36.w,
                      top: 32.h,
                      bottom: 32.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(60.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        /// Date
                        CustomText(
                          text: 'Date',
                          style: AppStyles.medium15.copyWith(
                            color: AppColors.lettersandIcons,
                          ),
                        ),

                        Gap(10.h),
                        // todo : Handle date picker
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 18.w,
                              vertical: 14.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius:
                                  BorderRadius.circular(18.r),
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'April 30, 2024',
                                  style: AppStyles.medium15,
                                ),

                                Container(
                                  padding: EdgeInsets.all(8.r),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.calendar_month,
                                    size: 18.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Gap(24.h),

                        /// Category
                        CustomText(
                          text: 'Category',
                          style: AppStyles.medium15.copyWith(
                            color: AppColors.lettersandIcons,
                          ),
                        ),

                        Gap(10.h),
                        // todo : Handle category selection
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 16.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(
                              18.r,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Select the category',
                                style: AppStyles.regular14
                                    .copyWith(
                                      color: Colors.grey,
                                    ),
                              ),

                              Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        ),

                        Gap(24.h),

                        /// Amount
                        CustomText(
                          text: 'Amount',
                          style: AppStyles.medium15.copyWith(
                            color: AppColors.lettersandIcons,
                          ),
                        ),

                        Gap(10.h),

                        // todo : Handle amount input and validation
                        CustomTextFormField(
                          hintText: '\$26.00',
                          isPassword: false,
                          controller: amountController,
                        ),

                        Gap(24.h),

                        /// Expense Title
                        CustomText(
                          text: 'Expense Title',
                          style: AppStyles.medium15.copyWith(
                            color: AppColors.lettersandIcons,
                          ),
                        ),

                        Gap(10.h),
                        // todo : Handle title input and validation
                        CustomTextFormField(
                          hintText: 'Dinner',
                          isPassword: false,
                          controller: titleController,
                        ),

                        Gap(24.h),

                        /// Message
                        // todo : Handle message input and validation
                        Container(
                          height: 150.h,
                          padding: EdgeInsets.all(16.r),
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(
                              18.r,
                            ),
                          ),
                          child: TextFormField(
                            controller: noteController,
                            maxLines: null,
                            expands: true,
                            decoration: const InputDecoration(
                              hintText: 'Enter Message',
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        /// Space for button
                        SizedBox(height: 120.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            /// Button
            Positioned(
              left: 0,
              right: 0,
              bottom: 30.h,
              child: Center(
                child: CustomButton(
                  width: 170.w,
                  text: 'Save',
                  textStyle: AppStyles.medium15.copyWith(
                    color: AppColors.lettersandIcons,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
