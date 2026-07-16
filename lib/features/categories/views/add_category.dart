import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/helpers/icon_mapper.dart';
import '../../../core/utils/app_colors.dart';
import '../../../shared/widgets/custom_text.dart';
import '../cubit/category_cubit.dart';
import '../data/models/category_model.dart';
import '../widgets/add_category_appbar.dart';
import '../widgets/category_name_field.dart';
import '../widgets/category_preview_card.dart';
import '../widgets/color_row.dart';
import '../widgets/field_label.dart';
import '../widgets/icon_grid.dart';
import '../widgets/save_bar.dart';

import '../widgets/type_toggle.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();

  final List<IconOption> _icons = const [
    IconOption('money', 'Salary'),
    IconOption('fork_knife', 'Food'),
    IconOption('bus', 'Transport'),
    IconOption('pill', 'Health'),
    IconOption('bag', 'Groceries'),
    IconOption('hand_holding', 'Rent'),
    IconOption('gift', 'Gifts'),
    IconOption('coins', 'Savings'),
    IconOption('ticket', 'Entertainment'),
    IconOption('house', 'Utilities'),
    IconOption('graduation_cap', 'Education'),
    IconOption('car', 'Car'),
    IconOption('shirt', 'Clothing'),
    IconOption('paw_print', 'Pets'),
    IconOption('airplane', 'Travel'),
    IconOption('phone', 'Phone Bill'),
    IconOption('wifi', 'Internet'),
    IconOption('credit_card', 'Debt'),
    IconOption('baby', 'Childcare'),
    IconOption('dumbbell', 'Fitness'),
    IconOption('wine_glass', 'Bar/Drinks'),
    IconOption('gas_pump', 'Fuel'),
    IconOption('tools', 'Maintenance'),
    IconOption('heart', 'Charity'),
    IconOption('briefcase', 'Business'),
    IconOption('question_mark', 'Other'),
  ];

  final List<Color> _colors = const [
    Color(0xFF5B5FEF), // primary indigo
    Color(0xFFEF6C5B), // coral
    Color(0xFF2FBF88), // emerald
    Color(0xFFF2B33D), // amber
    Color(0xFF3DB8F2), // sky
    Color(0xFFB25BEF), // violet
    Color(0xFFEF5B94), // pink
    Color(0xFF6E6E6E), // slate
  ];

  CategoryType _selectedType = CategoryType.expense;
  String? _selectedIconKey;
  Color _selectedColor = const Color(0xFF5B5FEF);

  bool get _isValid => _nameController.text.trim().isNotEmpty && _selectedIconKey != null;

  @override
  void initState() {
    super.initState();
    _selectedIconKey = _icons.first.key;
    _nameController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocus.dispose();
    super.dispose();
  }

  IconData get _selectedIconData => IconMapper.getIcon(_selectedIconKey!);

  void _onSave() {
    if (!_isValid) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: CustomText(text: 'Enter Valid Name or Choose Icon')));
    }

    context.read<CategoryCubit>().addCategory(
      CategoryModel()
        ..name = _nameController.text.trim()
        ..iconName = _selectedIconKey!
        ..colorValue = _selectedColor.value
        ..type = _selectedType,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(8.w, 4.h, 20.w, 4.h),

              /// AppBar
              child: const AddCategoryAppBar(),
            ),

            /// Transaction Type
            Container(
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: TypeToggle(
                color: _selectedColor,
                selectedType: _selectedType,
                onChanged: (type) => setState(() => _selectedType = type),
              ),
            ),

            Gap(20.h),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryPreviewCard(
                      iconData: _selectedIconData,
                      color: _selectedColor,
                      name: _nameController.text,
                    ),
                    Gap(32.h),
                    const FieldLabel(label: 'Name'),
                    Gap(10.h),
                    CategoryNameField(
                      controller: _nameController,
                      focusNode: _nameFocus,
                      selectedColor: _selectedColor,
                      onChanged: (_) => setState(() {}),
                    ),
                    Gap(28.h),
                    const FieldLabel(label: 'Icon'),
                    Gap(12.h),
                    IconGrid(
                      icons: _icons,
                      selectedKey: _selectedIconKey,
                      selectedColor: _selectedColor,
                      onSelect: (key) => setState(() => _selectedIconKey = key),
                    ),
                    Gap(28.h),
                    const FieldLabel(label: 'Color'),
                    Gap(12.h),
                    ColorRow(
                      colors: _colors,
                      selectedColor: _selectedColor,
                      onSelect: (color) => setState(() => _selectedColor = color),
                    ),
                  ],
                ),
              ),
            ),
            SaveBar(
              isEnabled: _isValid,
              color: _selectedColor,
              onSave: _onSave,
            ),
          ],
        ),
      ),
    );
  }
}

class IconOption {
  const IconOption(this.key, this.label);
  final String key;
  final String label;
}
