import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy/core/themes/app_colors.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/widgets/custom_app_scaffold.dart';
import 'package:masrofy/features/debts/views/widgets/custom_debts_card.dart';
import 'package:masrofy/features/debts/views/widgets/custom_row_debts.dart';
import 'package:masrofy/features/debts/views/widgets/debts_tab_card.dart';

class DebtsScreen extends StatefulWidget {
  const DebtsScreen({super.key});

  @override
  State<DebtsScreen> createState() => _DebtsScreenState();
}

class _DebtsScreenState extends State<DebtsScreen> {
  int _selectedTabIndex = 0;

  final List<Map<String, dynamic>> _allDebts = [
    {
      'title': 'قرض شخصي',
      'subtitle': 'الأهلي',
      'remaining': '3,000',
      'total': '6,000',
      'percentage': 60,
      'progress': 0.6,
      'color': AppColors.expense,
      'isPaid': false,
    },
    {
      'title': 'بطاقة الائتمان',
      'subtitle': 'البنك التجاري الدولي',
      'remaining': '1,250',
      'total': '2,000',
      'percentage': 37,
      'progress': 0.37,
      'color': AppColors.blue,
      'isPaid': false,
    },
    {
      'title': 'دين لصديق',
      'subtitle': 'أحمد محمد',
      'remaining': '950',
      'total': '1,000',
      'percentage': 95,
      'progress': 0.95,
      'color': AppColors.success,
      'isPaid': false,
    },
    // Mock paid debt for demonstrating tab filtering
    {
      'title': 'دين لـ محمد',
      'subtitle': 'مسترد كامل',
      'remaining': '0',
      'total': '2,000',
      'percentage': 100,
      'progress': 1.0,
      'color': AppColors.success,
      'isPaid': true,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).colorScheme.onSurface;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    //filter debets method
    final filterDebts = _allDebts.where((debt) {
      if (_selectedTabIndex == 1) {
        return !debt['isPaid'] &&
            double.parse((debt['remaining'].toString()).replaceAll(',', '')) >
                0;
      } else if (_selectedTabIndex == 2) {
        return debt['isPaid'] ||
            double.parse((debt['remaining'].toString()).replaceAll(',', '')) ==
                0;
      }

      return !debt['isPaid'] ||
          double.parse((debt['remaining'].toString()).replaceAll(',', '')) == 0;
    }).toList();
    return CustomAppScaffold(
      isDark: isDark,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: AppSizes.xxl,
            left: AppSizes.l,
            right: AppSizes.l,
          ),
          child: Column(
            children: [
              CustomDebtsRow(isDark: isDark, iconColor: iconColor),
              SizedBox(height: AppSizes.l),
              CustomDebtsCard(),
              SizedBox(height: AppSizes.l),
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTabItem('كل الديون', index: 0),
                  _buildTabItem('متبقي', index: 1),
                  _buildTabItem('مسددة', index: 2),
                ],
              ),
              SizedBox(height: AppSizes.xl),
              if (filterDebts.isEmpty)
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: AppSizes.xxl),
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        size: AppSizes.iconXL,
                        color: AppColors.grey400,
                      ),
                      SizedBox(height: AppSizes.m),
                      Text(
                        'لا توجد ديون حالياً',
                        style: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(color: AppColors.grey500),
                      ),
                    ],
                  ),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filterDebts.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: AppSizes.m),
                  itemBuilder: (context, index) {
                    final debts = filterDebts[index];
                    return DebtsTabCard(
                      title: debts['title'].toString(),
                      subtitle: debts['subtitle'].toString(),
                      remaining: debts['remaining'].toString(),
                      total: debts['total'] as String,
                      percentage: debts['percentage'].toInt(),
                      progressValue: debts['progress'].toDouble(),
                      progressColor: debts['color'] as Color,
                      isDark: isDark,
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(String label, {required int index}) {
    final isSelected = _selectedTabIndex == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () => setState(() {
        _selectedTabIndex = index;
      }),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: isSelected
                  ? AppColors.expense
                  : (isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          SizedBox(height: AppSizes.xs),
          Container(
            width: 60.w,
            height: 2.h,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.expense : Colors.transparent,
              borderRadius: BorderRadius.circular(1.r),
            ),
          ),
        ],
      ),
    );
  }
}
