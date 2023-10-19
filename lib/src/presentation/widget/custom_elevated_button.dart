import 'package:bloc_clean_architecture/src/comman/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.onTap,
    super.key,
    this.label,
    this.labelLoading,
    this.color,
    this.labelColor,
    this.child,
    this.isLoading = false,
    this.width = double.infinity,
    this.height = 47,
    this.labelSize,
    this.margin,
  });

  final Widget? child;
  final String? label;
  final String? labelLoading;
  final Color? color;
  final Color? labelColor;
  final VoidCallback onTap;
  final bool isLoading;
  final double width;
  final double height;
  final double? labelSize;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: (isLoading == true) ? () {} : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RADIUS),
          ),
        ),
        child: (isLoading == true)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SpinKitThreeBounce(
                    size: 15,
                    color: Colors.white,
                  ),
                  const SizedBox(width: SPACE12),
                  Text(
                    labelLoading ?? '',
                    style: theme.textTheme.labelLarge,
                  ),
                ],
              )
            : (label == '' || label == null)
                ? child
                : Text(
                    label ?? '',
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontSize: labelSize,
                      color: labelColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
      ),
    );
  }
}
