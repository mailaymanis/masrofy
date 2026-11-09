import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy/core/themes/app_colors.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/themes/app_text_styles.dart';
import 'package:masrofy/core/widgets/custom_app_scaffold.dart';
import 'package:masrofy/features/layout/view/widgets/custom_category.dart';
import 'package:masrofy/features/layout/view/widgets/custom_filter_container.dart';
import 'package:masrofy/features/layout/view/widgets/custom_reports_row.dart';
import 'package:masrofy/features/layout/view/widgets/custom_reports_state_container.dart';
import 'package:masrofy/features/layout/view/widgets/donut_chart.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = Theme.of(context).colorScheme.onSurface;
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomReportsRow(iconColor: iconColor),
              SizedBox(height: AppSizes.l),
              CustomFilterContainer(),
              SizedBox(height: AppSizes.l),
              Row(
                spacing: AppSizes.m,
                children: [
                  CustomReportsStateContainer(
                    label: 'إجمالي الدخل',
                    amount: '27,850',
                    changeText: '▲ 12%',
                    changeColor: AppColors.income,
                    subText: 'من الشهر الماضي',
                  ),
                  CustomReportsStateContainer(
                    label: 'إجمالي المصروفات',
                    amount: '15,400',
                    changeText: '▼ 8%',
                    changeColor: AppColors.expense,
                    subText: 'من الشهر الماضي',
                  ),
                ],
              ),
              SizedBox(height: AppSizes.m),
              Row(
                spacing: AppSizes.m,
                children: [
                  CustomReportsStateContainer(
                    label: 'صافي الدخل',
                    amount: '12,450',
                    subText: '',
                  ),
                  CustomReportsStateContainer(
                    label: 'معدل التوفير',
                    amount: '45%',
                    subText: 'من الدخل',
                    isPercentage: true,
                  ),
                ],
              ),
              SizedBox(height: AppSizes.m),
              Container(
                padding: EdgeInsets.all(AppSizes.m),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.cardDark : Colors.white,
                  borderRadius: BorderRadius.circular(AppSizes.rXL),
                  border: Border.all(
                    color: isDark
                        ? AppColors.borderDark
                        : AppColors.borderLight,
                  ),
                ),
                child: Column(
                  children: [
                    // Section Title
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'المصروفات حسب الفئة',
                        style: AppTextStyles.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: AppSizes.xxl),

                    // Donut Chart
                    SizedBox(
                      width: 200.w,
                      height: 200.h,
                      child: const DonutChart(),
                    ),
                    SizedBox(height: AppSizes.l),

                    // Category Legend
                    const CategoryLegend(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
