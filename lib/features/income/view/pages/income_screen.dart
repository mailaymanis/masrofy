import 'package:flutter/material.dart';
import 'package:masrofy/core/themes/app_colors.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/widgets/custom_app_scaffold.dart';
import 'package:masrofy/features/income/view/widgets/custom_income_card.dart';
import 'package:masrofy/features/income/view/widgets/custom_income_row.dart';
import 'package:masrofy/features/income/view/widgets/income_list_card.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> incomeSources = [
      {
        'title': 'الراتب الشهري',
        'subtitle': 'الشركة الحالية',
        'amount': '20,000',
        'frequency': 'كل شهر',
        'icon': Icons.business_center_rounded,
        'color': AppColors.primary,
      },
      {
        'title': 'عمل حر',
        'subtitle': 'مشاريع مستقلة',
        'amount': '5,000',
        'frequency': 'كل شهر',
        'icon': Icons.laptop_mac_rounded,
        'color': AppColors.primary,
      },
      {
        'title': 'استثمار',
        'subtitle': 'أرباح الاستثمار',
        'amount': '2,500',
        'frequency': 'كل 3 أشهر',
        'icon': Icons.trending_up_rounded,
        'color': AppColors.accent,
      },
      {
        'title': 'أخرى',
        'subtitle': 'دخل إضافي',
        'amount': '350',
        'frequency': 'عند الحاجة',
        'icon': Icons.more_horiz_rounded,
        'color': AppColors.purple,
      },
    ];
    final iconColor = Theme.of(context).colorScheme.onSurface;
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
              CustomIncomeRow(isDark: isDark, iconColor: iconColor),
              SizedBox(height: AppSizes.l),
              CustomIncomeCard(),
              SizedBox(width: AppSizes.l),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: incomeSources.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSizes.m),
                itemBuilder: (context, index) {
                  final item = incomeSources[index];
                  return IncomeListCard(
                    title: item['title'].toString(),
                    subtitle: item['subtitle'].toString(),
                    amount: item['amount'].toString(),
                    frequency: item['frequency'].toString(),
                    icon: item['icon'] as IconData,
                    color: item['color'] as Color,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
