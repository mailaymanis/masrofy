import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy/core/themes/app_colors.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/widgets/custom_app_scaffold.dart';
import 'package:masrofy/features/goals/views/widgets/custom_goals_card.dart';
import 'package:masrofy/features/goals/views/widgets/custom_goals_row.dart';
import 'package:masrofy/features/goals/views/widgets/goals_tab_card.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  int _selectedTabIndex = 0;

  final List<Map<String, dynamic>> _allGoals = [
    {
      'title': 'شراء سيارة',
      'current': '250,000',
      'target': '250,000',
      'percentage': 100,
      'progress': 1,
      'icon': Icons.directions_car_rounded,
      'color': AppColors.blue,
      'isActive': false,
    },
    {
      'title': 'سفر تركيا',
      'current': '12,500',
      'target': '25,000',
      'percentage': 50,
      'progress': 0.5,
      'icon': Icons.airplanemode_active_rounded,
      'color': AppColors.success,
      'isActive': true,
    },
    {
      'title': 'صندوق الطوارئ',
      'current': '8,000',
      'target': '10,000',
      'percentage': 80,
      'progress': 0.8,
      'icon': Icons.shield_rounded,
      'color': AppColors.success,
      'isActive': true,
    },
    {
      'title': 'شراء منزل',
      'current': '0',
      'target': '500,000',
      'percentage': 0,
      'progress': 0.0,
      'icon': Icons.home_rounded,
      'color': AppColors.expense,
      'isActive': true,
    },

    {
      'title': 'هاتف جديد',
      'current': '15,000',
      'target': '15,000',
      'percentage': 100,
      'progress': 1.0,
      'icon': Icons.phone_android_rounded,
      'color': AppColors.success,
      'isActive': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).colorScheme.onSurface;

    final filteredGoals = _allGoals.where((goal) {
      if (_selectedTabIndex == 1) {
        return !goal['isActive'];
      }
      return goal['isActive'];
    }).toList();
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
              CustomGoalsRow(isDark: isDark, iconColor: iconColor),
              SizedBox(height: AppSizes.l),
              CustomGoalsCard(isDark: isDark),
              SizedBox(height: AppSizes.l),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTabItem("نشطة", index: 0),
                  SizedBox(width: AppSizes.l),
                  buildTabItem("مكتملة", index: 1),
                ],
              ),
              SizedBox(height: AppSizes.l),
              if (filteredGoals.isEmpty)
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: AppSizes.xxl),
                      Icon(
                        Icons.track_changes_outlined,
                        size: AppSizes.iconXL,
                        color: AppColors.grey400,
                      ),
                      SizedBox(height: AppSizes.m),
                      Text(
                        'لا توجد أهداف هنا',
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
                  itemCount: filteredGoals.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(width: AppSizes.m),
                  itemBuilder: (context, index) {
                    final goal = filteredGoals[index];
                    return GoalsTabCard(
                      isDark: isDark,
                      title: goal['title'].toString(),
                      current: goal['current'].toString(),
                      target: goal['target'].toString(),
                      percentage: goal['percentage'].toInt(),
                      progressValue: goal['progress'].toDouble(),
                      icon: goal['icon'] as IconData,
                      color: goal['color'] as Color,
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabItem(String label, {required int index}) {
    final isSelected = _selectedTabIndex == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final activeColor = AppColors.purple;

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
                  ? activeColor
                  : (isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          SizedBox(height: AppSizes.xs),
          Container(
            width: 70.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: isSelected ? activeColor : Colors.transparent,
              borderRadius: BorderRadius.circular(AppSizes.rXL),
            ),
          ),
        ],
      ),
    );
  }
}
