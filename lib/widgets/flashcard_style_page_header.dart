import 'package:flutter/material.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/typography.dart';

/// Top bar matching the original flashcard screen (grey title, back button).
class FlashcardStylePageHeader extends StatelessWidget {
  const FlashcardStylePageHeader({
    super.key,
    required this.title,
    required this.onBack,
    this.trailing,
  });

  final String title;
  final VoidCallback onBack;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorPallete.disabled,
            size: 28,
          ),
          onPressed: onBack,
        ),
        Text(
          title,
          style: body.copyWith(
            color: ColorPallete.disabled,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing ??
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.transparent,
                size: 28,
              ),
              onPressed: () {},
            ),
      ],
    );
  }
}
