import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../data/models/category_model.dart';
import '../widgets/add_expense_appbar.dart';
import '../widgets/date_picker_field.dart';
import '../widgets/field_label.dart';
import '../../transactions/cubit/transaction_cubit.dart';
import '../../transactions/data/models/transaction_model.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../../../shared/widgets/custom_btn.dart';
import '../../../shared/widgets/custom_text_form_field.dart';
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

  DateTime selectedDate = DateTime.now();

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(), // no future expenses, adjust if needed
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
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                CustomAppBar(
                  expandedHeight: 120.h,
                  topRow: const TopAppBar(
                    title: 'Add Expenses',
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
                      borderRadius: .vertical(
                        top: .circular(60.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        /// Date
                        const FieldLabel(label: 'Date'),

                        Gap(10.h),

                        DatePickerField(
                          date: selectedDate,
                          onTap: _pickDate,
                        ),

                        Gap(24.h),

                        /// Amount
                        const FieldLabel(label: 'Amount'),

                        Gap(10.h),

                        CustomTextFormField(
                          hintText: '\$26.00',
                          isPassword: false,
                          controller: _amountController,
                        ),

                        Gap(24.h),

                        /// Expense Title
                        const FieldLabel(
                          label: 'Expense Title',
                        ),

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
    );
  }
}
