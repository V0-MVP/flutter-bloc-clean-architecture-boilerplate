import 'package:bloc_clean_architecture/src/comman/colors.dart';
import 'package:bloc_clean_architecture/src/comman/constant.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {

  const CustomOutlinedButton({
    Key? key,
    required this.onTap,
    required this.label,
    this.width = double.infinity,
    this.height = 45.0,
    this.color = ColorLight.primary,
    this.labelColor = Colors.white,
  }) : super(key: key);
  
  final void Function()? onTap;
  final String? label;
  final double height;
  final double width;
  final Color? color;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          disabledForegroundColor:  Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RADIUS),
            side: BorderSide(
              color: theme.primaryColor,
            ),
          ),
        ),
        child: Text(
          label!,
          style: theme.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
