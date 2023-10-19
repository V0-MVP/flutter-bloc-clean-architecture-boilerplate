import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.textColor,
    this.fontSize = 14.0,
    this.enableUnderline = false,
  }) : super(key: key);
  
  final String label;
  final VoidCallback? onTap;
  final Color? textColor;
  final double fontSize;
  final bool enableUnderline;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: onTap,
      child: Text(
        label,
        style: theme.textTheme.headline3?.copyWith(
          color: (textColor == null) ? null : textColor,
          fontSize: fontSize,
          decoration: (enableUnderline == true)
              ? TextDecoration.underline
              : TextDecoration.none,
        ),
      ),
    );
  }
}
