import 'package:flutter/material.dart';
import 'package:masrofy/core/themes/app_colors.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/themes/app_text_styles.dart';
import 'package:masrofy/core/widgets/custom_app_scaffold.dart';
import 'package:masrofy/features/expenses/view/widgets/custom_expenses_card.dart';
import 'package:masrofy/features/expenses/view/widgets/custom_expenses_row.dart';
import 'package:masrofy/features/expenses/view/widgets/expenses_list_card.dart';
import 'package:masrofy/features/expenses/view/widgets/transaction_item.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> groups = [
      {
        'date': 'اليوم',
        'items': [
          {
            'title': 'مطعم',
            'subtitle': 'غداء مع الأصدقاء',
            'time': '12:30 م',
            'amount': '180',
            'icon': Icons.restaurant_rounded,
            'iconColor': AppColors.expense,
            'isHighlighted': true,
          },
          {
            'title': 'مواصلات',
            'subtitle': 'مترو',
            'time': '08:15 ص',
            'amount': '20',
            'icon': Icons.directions_car_rounded,
            'iconColor': AppColors.blue,
            'isHighlighted': false,
          },
          {
            'title': 'قهوة',
            'subtitle': 'ستاربكس',
            'time': '07:45 ص',
            'amount': '45',
            'icon': Icons.local_cafe_rounded,
            'iconColor': AppColors.orange,
            'isHighlighted': false,
          },
          {
            'title': 'تسوق',
            'subtitle': 'من السوبر ماركت',
            'time': '06:30 م',
            'amount': '215',
            'icon': Icons.shopping_bag_rounded,
            'iconColor': AppColors.success,
            'isHighlighted': false,
          },
        ],
      },
      {
        'date': 'أمس',
        'items': [
          {
            'title': 'فواتير',
            'subtitle': 'فاتورة الكهرباء',
            'time': '4:30 م',
            'amount': '350',
            'icon': Icons.electric_bolt_rounded,
            'iconColor': AppColors.purple,
            'isHighlighted': true,
          },
          {
            'title': 'تسوق',
            'subtitle': 'ملابس',
            'time': '2:15 م',
            'amount': '320',
            'icon': Icons.shopping_bag_rounded,
            'iconColor': AppColors.success,
            'isHighlighted': false,
          },
        ],
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomExpensesRow(isDark: isDark, iconColor: iconColor),
              SizedBox(height: AppSizes.l),
              CustomExpensesCard(),
              SizedBox(height: AppSizes.m),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: groups.length,
                itemBuilder: (context, index) {
                  final group = groups[index];
                  final date = group['date'].toString();
                  final items = group['items'] as List<Map<String, dynamic>>;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        date,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: AppSizes.s),
                      ExpensesListCard(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return TransactionItem(
                            title: item['title'] as String,
                            subtitle: item['subtitle'] as String,
                            time: item['time'] as String,
                            amount: item['amount'] as String,
                            icon: item['icon'] as IconData,
                            iconColor: item['iconColor'] as Color,
                            isHighlighted: item['isHighlighted'] as bool,
                          );
                        },
                      ),
                    ],
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
