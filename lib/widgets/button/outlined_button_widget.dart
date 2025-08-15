import 'package:flutter/material.dart';
import 'package:learning_language_app/const/typography.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Widget? icon;

  const OutlinedButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final child =
        icon == null
            ? Text(label, style: button)
            : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon!,
                const SizedBox(width: 8),
                Text(label, style: button),
              ],
            );

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: child,
    );
  }
}
