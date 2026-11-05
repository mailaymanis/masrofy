import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/widgets/custom_buttons.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, this.text, this.onPressed});
  final String? text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "التسجيل من خلال جوجل",
      variant: ButtonVariant.outlined,
      onPressed: onPressed,
      icon: FaIcon(FontAwesomeIcons.google, size: AppSizes.iconM),
      textStyle: Theme.of(context).textTheme.titleMedium,
    );
  }
}
