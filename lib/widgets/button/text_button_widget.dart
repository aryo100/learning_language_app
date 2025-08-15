import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Widget? prefixIcon;
  final bool isDisabled;
  final TextStyle? textStyle;

  const TextButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    this.prefixIcon,
    this.isDisabled = false,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        overlayColor: Colors.transparent,
        disabledBackgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadowColor: Colors.transparent,
      ),
      child: Text(
        "Back",
        style: isDisabled ? textStyle?.copyWith(color: Colors.grey) : textStyle,
      ),
    );
  }
}
