import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/themes/app_text_styles.dart';
import 'package:masrofy/core/themes/theme_mode_provider.dart';
import 'package:masrofy/core/widgets/custom_buttons.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text("appTitle").tr(),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              ref.read(themeModeProvider.notifier).toggleThemeMode();
            },
          ),
        ],
      ),
    );
  }
}
