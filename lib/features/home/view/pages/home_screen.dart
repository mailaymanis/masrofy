import 'package:flutter/material.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/widgets/custom_app_scaffold.dart';
import 'package:masrofy/features/home/view/widgets/custom_card.dart';
import 'package:masrofy/features/home/view/widgets/custom_row.dart';
import 'package:masrofy/features/home/view/widgets/overview_section.dart';
import 'package:masrofy/features/home/view/widgets/quick_tools.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              CustomRow(isDark: isDark),
              SizedBox(height: AppSizes.l),
              CustomCard(isDark: isDark),
              SizedBox(height: AppSizes.l),
              QuickTools(isDark: isDark),
              SizedBox(height: AppSizes.l),
              OverviewSection(isDark: isDark),
            ],
          ),
        ),
      ),
    );
  }
}
