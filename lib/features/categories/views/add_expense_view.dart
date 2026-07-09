import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/features/categories/data/models/category_model.dart';
import 'package:fin_wise/features/categories/widgets/date_picker_field.dart';
import 'package:fin_wise/features/categories/widgets/field_label.dart';
import 'package:fin_wise/features/transactions/cubit/transaction_cubit.dart';
import 'package:fin_wise/features/transactions/data/models/transaction_model.dart';
import 'package:fin_wise/shared/custom_app_bar.dart';
import 'package:fin_wise/shared/custom_btn.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:fin_wise/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddExpenseView extends StatefulWidget {
  const AddExpenseView({super.key, required this.category});
  final CategoryModel category;

  @override
  State<AddExpenseView> createState() => _AddExpenseViewState();
}

class _AddExpenseViewState extends State<AddExpenseView> {
  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate:
          DateTime.now(), // no future expenses, adjust if needed
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  void _saveExpense() {
    final amount = double.tryParse(_amountController.text);
    if (amount == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid amount'),
        ),
      );
      return;
    }

    final transaction = TransactionModel()
      ..title = _titleController.text.trim()
      ..amount = amount
      ..date = selectedDate
      ..categoryId = widget.category.id;

    context.read<TransactionCubit>().addTransaction(transaction);
    context.pop();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: AppColors.primary,
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  CustomAppBar(
                    expandedHeight: 120.h,
                    topRow: _buildAppBar(context),
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
                          FieldLabel(label: 'Date'),

                          Gap(10.h),

                          DatePickerField(
                            date: selectedDate,
                            onTap: _pickDate,
                          ),

                          Gap(24.h),

                          /// Amount
                          FieldLabel(label: 'Amount'),

                          Gap(10.h),

                          CustomTextFormField(
                            hintText: '\$26.00',
                            isPassword: false,
                            controller: _amountController,
                          ),

                          Gap(24.h),

                          /// Expense Title
                          FieldLabel(label: 'Expense Title'),

                          Gap(10.h),

                          CustomTextFormField(
                            hintText: 'Dinner',
                            isPassword: false,
                            controller: _titleController,
                          ),

                          Gap(24.h),

                          /// Space for button
                          SizedBox(height: 400.h),
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
                    onTap: _saveExpense,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// AppBar
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios, size: 24.sp),
        ),

        CustomText(
          text: 'Add Expenses',
          style: AppStyles.semiBold20,
        ),

        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: .2),
          ),
          child: Icon(Icons.notifications, size: 24.sp),
        ),
      ],
    );
  }
}
