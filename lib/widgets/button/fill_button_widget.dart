import 'package:flutter/material.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/typography.dart';

class FillButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Widget? prefixIcon;
  final bool isDisabled;
  final TextStyle? textStyle;
  final Color backgroundColor;

  const FillButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    this.prefixIcon,
    this.isDisabled = false,
    this.textStyle,
    this.backgroundColor = ColorPallete.accent,
  });

  @override
  Widget build(BuildContext context) {
    final child =
        prefixIcon == null
            ? Text(label, style: textStyle ?? button)
            : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                prefixIcon!,
                const SizedBox(width: 8),
                Text(label, style: textStyle ?? button),
              ],
            );

    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isDisabled ? ColorPallete.disabled : backgroundColor,
        foregroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: child,
      ),
    );
  }
}
