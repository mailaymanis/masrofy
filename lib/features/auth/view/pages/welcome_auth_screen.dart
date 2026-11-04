import 'package:flutter/material.dart';
import 'package:masrofy/core/themes/app_colors.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/widgets/custom_app_scaffold.dart';
import 'package:masrofy/features/auth/view/widgets/app_logo.dart';
import 'package:masrofy/features/auth/view/widgets/auth_button.dart';

class WelcomeAuthScreen extends StatelessWidget {
  const WelcomeAuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomAppScaffold(
      isDark: isDark,
      child: Column(
        children: [
          Spacer(flex: 1),
          AppLogo(),
          SizedBox(height: AppSizes.xl),
          Text(
            "مصروفي",
            style: Theme.of(context).textTheme.displayLarge!
                .copyWith(color: isDark ? Colors.white : AppColors.primary),
          ),
          SizedBox(height: AppSizes.m),
          Text(
            "مرحبا بك مجددا في مصروفي",
            style: Theme.of(context).textTheme.titleSmall!
                .copyWith(color: isDark ? Colors.white : AppColors.primary),
          ),
          SizedBox(height: AppSizes.s),
          Text(
            "أدر مصروفاتك وديونك وأهدافك المالية في مكان واحد",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: isDark ? AppColors.grey100 : AppColors.primary,
            ),
          ),
          SizedBox(height: AppSizes.xxxl),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.l),
            child: AuthButton(),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
